# frozen_string_literal: true

require "rails_helper"

RSpec.describe Meeting do
  let(:meeting) { FactoryBot.create(:meeting) }

  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  context "when creating a Meeting" do
    it "checks that the location is not blank" do
      meeting.location = ""
      meeting.save
      expect(meeting.errors[:location].size).to be > 0
    end

    it "checks that meetings aren't allowed in the bar" do
      meeting.meetingtype = "Bar"
      meeting.save
      expect(meeting.errors[:meetingtype].size).to eq(1)
    end

    it "allows a valid meeting to be created" do
      meeting.save
      expect(meeting).to be_valid
    end

    it "prevents meetings with duplicate dates from being created" do
      meeting.save
      dupmeeting = FactoryBot.build(:meeting, date: meeting.date)
      dupmeeting.save
      dupmeeting.errors.full_messages.each { |e| puts e.inspect }
      puts "There are now #{Meeting.count} meetings in the database."
      expect(dupmeeting.errors[:date].size).to eq(1)
    end
  end
end
