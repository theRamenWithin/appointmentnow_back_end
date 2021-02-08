class OrganizationRolesController < ApplicationController
  before_action :set_organization_role, only: %i[ show edit update destroy ]

  # GET /organization_roles/1 or /organization_roles/1.json
  def show
  end

  # POST /organization_roles or /organization_roles.json
  def create
    @organization_role = OrganizationRole.new(
      organization_id: organization_role_params[:organization_id],
      user_id: organization_role_params[:user_id],
      role: 0
    )
    if @organization_role.save
      render json: {
        status: 200,
        joined: true
      }
    else 
      render json: {
        status: 500,
        errors: @organization_role.errors.full_messages
      }
    end
  end

  # PATCH/PUT /organization_roles/1 or /organization_roles/1.json
  def update
    respond_to do |format|
      if @organization_role.update(organization_role_params)
        format.html { redirect_to @organization_role, notice: "Organization role was successfully updated." }
        format.json { render :show, status: :ok, location: @organization_role }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_roles/1 or /organization_roles/1.json
  def destroy
    @organization_role.destroy
    respond_to do |format|
      format.html { redirect_to organization_roles_url, notice: "Organization role was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_role
      @organization_role = OrganizationRole.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_role_params
      params.require(:organization_role).permit(:organization_id, :user_id, :role)
    end
end
