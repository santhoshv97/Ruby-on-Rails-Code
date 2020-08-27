class Api::V1::CustomersController < ApplicationController
    # GET /customers
    # GET /customers.json
    def index
        @employee = Employee.find(params[:employee_id])
        @customers = @employee.customers.all
        render json: {status: :SUCCESS, message:'Loaded customer', data:@customers }, status: :ok
    end

    # GET /customers/1
    # GET /customers/1.json
    def show
        @employee = Employee.find(params[:employee_id])
        @customer = @employee.customers.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded customer', data:@customer}, status: :ok
    end

    # GET /customers/new
    def new
    end

    # GET /customers/1/edit
    def edit
    end

    # POST /customers
    # POST /customers.json
    def create
        @employee = Employee.find(params[:employee_id])
        @customer = @employee.customers.create(customer_params)
        #@customer = Customer.new(customer_params)

        if @customer.save
            render json: {status: 'SUCCESS', message:'Saved customer', data:@customer}, status: :ok
          else
            render json: {status: 'ERROR', message:'customer not saved', data:@customer.errors}, status: :unprocessable_entity
        end   
    end

    # PATCH/PUT /customers/1
    # PATCH/PUT /customers/1.json
    def update
        @employee = Employee.find(params[:employee_id])
        @customer = @employee.customers.find(params[:id])
        if @customer.update(customer_params)
            render json: {status: 'SUCCESS', message:'updated customer', data:@customer}, status: :ok
          else
            render json: {status: 'ERROR', message:'customer not updated', data:@customer.errors}, status: :unprocessable_entity
        end 
    end

    # DELETE /customers/1
    # DELETE /customers/1.json
    def destroy
        @employee = Employee.find(params[:employee_id])
        @customer =  @employee.customers.find(params[:id])
        @customer.destroy
        render json: {status: 'SUCCESS', message:'Deleted customer', data:@customer}, status: :ok
    end

    private
    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:customername,:customerid,:phno)
    end
end
