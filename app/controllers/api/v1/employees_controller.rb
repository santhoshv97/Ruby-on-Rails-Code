class Api::V1::EmployeesController < ApplicationController
    # GET /employees
    # GET /employees.json
    def index
        @employees = Employee.all
        render json: {status: :SUCCESS, message:'Loaded Employees', data:@employees }, status: :ok
    end

    # GET /employees/1
    # GET /employees/1.json
    def show
        @employee = Employee.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded Employee', data:@employee}, status: :ok
    end

    # GET /employees/new
    def new
        @employee = Employee.new
    end

    # GET /employees/1/edit
    def edit
    end

    # POST /employees
    # POST /employees.json
    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            render json: {status: 'SUCCESS', message:'Saved Employee', data:@employee}, status: :ok
          else
            render json: {status: 'ERROR', message:'Employee not saved', data:@employee.errors}, status: :unprocessable_entity
        end   
    end

    # PATCH/PUT /employees/1
    # PATCH/PUT /employees/1.json
    def update
        @employee = Employee.find(params[:id])
        if @employee.update(employee_params)
            render json: {status: 'SUCCESS', message:'updated Employee', data:@employee}, status: :ok
          else
            render json: {status: 'ERROR', message:'Employee not updated', data:@employee.errors}, status: :unprocessable_entity
        end 
    end

    # DELETE /employees/1
    # DELETE /employees/1.json
    def destroy
        @employee = Employee.find(params[:id])
        @employee.destroy
        render json: {status: 'SUCCESS', message:'Deleted Employee', data:@employee}, status: :ok
    end

    private
    # Only allow a list of trusted parameters through.
    def employee_params
      params.require(:employee).permit(:empid,:empname,:empsalary,:empage)
    end
    
end
