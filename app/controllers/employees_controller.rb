class EmployeesController < ApplicationController
    def create
        @employee = Employee.create(employee_params)
        @employee.company = Company.find(params[:company_id])
        @employee.save

        redirect_to @employee.company
    end
    def destroy
      @employee = Employee.find(params[:id])
      @employee.destroy
      redirect_to @employee.company, notice: 'eliminado'

    end
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_company
        @company = Company.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def employee_params
        params.require(:employee).permit(:first_name, :last_name, :email, :company, :area_id)
      end
end
