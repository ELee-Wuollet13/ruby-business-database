class EmployeesController < ApplicationController

  def index
    @division = Division.find(params[:division_id])
    @employees = @division.employees
    render :index
  end

  def new
    @division = Division.find(params[:division_id])
    @employee = @division.employees.new
    render :new
  end

  def create
    @division = Division.find(params[:division_id])
    @employee = @division.employees.new(employee_params)
    if @employee.save
      redirect_to division_path(@division)
    else
      render :new
    end
  end

  def edit
    binding.pry
    @division = Division.find(params[:division_id])
    @employee = Employee.find(params[:id])
    @projects = Project.all
    render :edit
  end

  def show
    @division = Division.find(params[:division_id])
    @employee = Employee.find(params[:id])
    render :show
  end

  def update
    @division = Division.find(params[:division_id])
    @employee = Employee.find(params[:id])
    @project = Project.find(params[:project_id])
    if @project
      @employee.projects << @project
      redirect_to division_employee_path(@division, @employee)
    end
    if @employee.update(employee_params)
      redirect_to division_path(@division)
    else
      render :edit
    end
  end

  def destroy
    @division = Division.find(params[:division_id])
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to division_path(@division)
  end

  private
    def employee_params
      params.require(:employee).permit(:name, :project_id)
    end
end
