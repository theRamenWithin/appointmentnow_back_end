class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[ edit update destroy ]

  # GET /organizations/1 or /organizations/1.json
  def show
    @organization = Organization.find_by(organization_name: params[:organizationUnique][:organization_name])
    if @organization
      render json: {
        nameID: @organization.id,
        unique: false
      }
    else
      render json: {
        unique: true
      }
    end
  end

  def search
    @organizations = Organization.where('organization_name ILIKE ?', '%' + params[:organizationSearch][:organization_name] + '%')
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

  # POST /organizations or /organizations.json
  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      @organization_role = OrganizationRole.new(
        organization_id: organization_params[:id],
        user_id: session[:user_id],
        role: 2
      )
      @organization_role.save
      render json: {
        status: 200,
        created: true,
        organization_path: @organization.organization_name.parameterize 
      }
      @address = Address.new(
        address_line_1: nil,
        address_line_2: nil,
        city: nil,
        state: nil,
        country: nil,
        postcode: nil,
        user_id: nil,
        organization_id: @organization.id
      )
      @address.save
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

  def org_routes
    @org_param_routes = []

    Organization.all.each do |org|
      @org_param_routes << org.organization_name.parameterize
    end

    if @org_param_routes
      render json: {
        organizations_routes: @org_param_routes
      }
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
