class Api::V1::AddressesController < ApplicationController
    # GET /addresses
    # GET /addresses.json
    def index
        #@employee = Employee.find(params[:employee_id])
        @addresses = Address.all
        render json: {status: :SUCCESS, message:'Loaded address', data:@addresses }, status: :ok
    end

    # GET /addresses/1
    # GET /addresses/1.json
    def show
        #@employee = Employee.find(params[:employee_id])
        @address = Address.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded address', data:@address}, status: :ok
    end

    # GET /addresses/new
    def new
    end

    # GET /addresses/1/edit
    def edit
    end

    # POST /addresses
    # POST /addresses.json
    def create
        #@employee = Employee.find(params[:employee_id])
        #@address = @employee.address.create(address_params)
        @address = Address.new(address_params)

        if @address.save
            render json: {status: 'SUCCESS', message:'Saved address', data:@address}, status: :ok
          else
            render json: {status: 'ERROR', message:'address not saved', data:@address.errors}, status: :unprocessable_entity
        end   
    end

    # PATCH/PUT /addresses/1
    # PATCH/PUT /addresses/1.json
    def update
        #@employee = Employee.find(params[:employee_id])
        @address = Address.find(params[:id])
        if @address.update(address_params)
            render json: {status: 'SUCCESS', message:'updated address', data:@address}, status: :ok
          else
            render json: {status: 'ERROR', message:'address not updated', data:@address.errors}, status: :unprocessable_entity
        end 
    end

    # DELETE /addresses/1
    # DELETE /addresses/1.json
    def destroy
        #@employee = Employee.find(params[:employee_id])
        @address = Address.find(params[:id])
        @address.destroy
        render json: {status: 'SUCCESS', message:'Deleted address', data:@address}, status: :ok
    end

    private
    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:addresscode,:street,:district,:employee_id)
    end
end
