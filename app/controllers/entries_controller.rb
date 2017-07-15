class EntriesController < ApplicationController
  def index
    @entries = Entry.order(:id)
    render json: { message: "ok", entries_data: @entries }
  end
  
  def show
    begin
      @entry = Entry.find(params[:id])
      render json: { message: "ok", entries_data: @entry }
    rescue ActiveRecord::RecordNotFound
      render json: { message: "no entry matches that ID" }, status: 404
    rescue Exception
      render json: { message: "there was some other error" }, status: 500
    end
  end

  def create
    begin
      @entry = Entry.new(entry_params)
      @entry.save 
      @all_entries = Entry.order(:id)
      render json: { message: "entry added successfully", entries_data: @all_entries }
      rescue Exception => e
        logger.info "Caught exception: #{e.inspect}"
      end
  end

  def update
    begin 
      @entry = Entry.find(params[:id])
      @entry.update(entry_params)
      @all_entries = Entry.order(:id)
      render json: { message: "entry updated successfully", entries_data: @all_entries }
    rescue Exception
      render json: { message: "there was an error" }
    end
  end
end