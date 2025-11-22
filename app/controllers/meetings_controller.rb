# frozen_string_literal: true

class MeetingsController < ApplicationController
  before_action :set_meeting, only: %i[show edit update destroy]
  respond_to :html, :json

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.order(id: :desc)
    # Search for items using OR: http://stackoverflow.com/questions/3639656/activerecord-or-query
    if params[:search].present?
      t = @meetings.arel_table
      match_string = "%#{params[:search]}%"
      @meetings = @meetings.where(t[:date].eq(Date.parse(params[:search])).or(t[:location].matches(match_string).or(t[:meetingtype].matches(match_string))))
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @items = @meeting.items
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      redirect_to meetings_path
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    if @meeting.update(meeting_params)
      redirect_to meetings_path
    else
      render :form_update, status: :unprocessable_entity
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: "Meeting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.expect(meeting: [ :date, :meetingtype, :location, :minutes_url, :search ])
  end
end
