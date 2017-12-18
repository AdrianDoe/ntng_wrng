class Admin::TeamsController < Admin::AdminController
  before_action :set_admin_teams, only: [:show, :edit, :update, :destroy]

  def index
    @teams = Team.all
  end

  def show
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Teams.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to [:admin, @team], notice: 'Team member was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @team.update(team_member_params)
        format.html { redirect_to [:admin, @team], notice: 'Team member was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to admin_teams_url, notice: 'Team member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_admin_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.fetch(:team, {}).permit(:name, :bio, :avatar, :sponsors)
  end
end
