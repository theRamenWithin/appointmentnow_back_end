class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[ show edit update destroy ]

  # GET /organizations or /organizations.json
  def index
    @organizations = Organization.all
  end

  # GET /organizations/1 or /organizations/1.json
  def show
    @organization = Organization.find(organization: params[:organization_name])
    if @organization
      render json: {
        unique: false
      }
    else
      render json: {
        unique: true
      }
    end
  end

  def search
    @organizations = Organization.where('organization_name LIKE ?', params[:organization][:organization_name] + '%')
    if @organizations
      render json: {
        organizations: @organizations
      }
    else
      render json: {
        organizations: false
      }
    end
  end

  # # GET /organizations/new
  # def new
  #   @organization = Organization.new
  # end

  # # GET /organizations/1/edit
  # def edit
  # end

  # POST /organizations or /organizations.json
  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      # TODO A method to assign a role of administrator
      @organization_role = OrganizationRole.new(
        organization_id: organization_params[:id],
        user_id: user,
        role: 2
      )
      @organization_role.save
      render json: {
        status: 200,
        created: true,
        organization_path: @organization.organization_name.parameterize 
      }
    else 
      render json: {
        status: 500,
        errors: @organization.errors.full_messages
      }
    end
  end

  # PATCH/PUT /organizations/1 or /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: "Organization was successfully updated." }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1 or /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: "Organization was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_params
      params.require(:organization).permit(:organization_name, :description, :phone, :email)
    end
end
