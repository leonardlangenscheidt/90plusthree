class LeaguesController < ApplicationController
  before_action :set_league, only: [:show, :edit, :update, :destroy, :addteam]

  # GET /leagues
  # GET /leagues.json
  def index
    @leagues = League.all
  end

  # GET /leagues/1
  # GET /leagues/1.json
  def show

    @teams = @league.teams

    #table0

    @tabelle0 = []
    @teams.each do |team|
      @points = 0
      @goalsScored = 0
      @goalsConceded = 0
      team.matches.each do |m|

        m.corrections.each do |c|
          if c.typeOfCorrection == 0
            if m.mirror == false
              m.real_result += c.change
            else
              m.real_result += c.mirrorchange
            end
          end
        end

        # points
        if m.team1goals > m.team2goals
          @points += 3
        elsif m.team1goals == m.team2goals
          @points += 1
        end

        # goals
        @goalsScored += m.team1goals
        @goalsConceded += m.team2goals
      end
      @goalDifference = @goalsScored - @goalsConceded
      @tabelle0.push([team.name, @points, @goalDifference, @goalsScored, @goalsConceded, team.id])
    end

    @tabelle0.sort!  { |a,b| [ b[1], b[2] ] <=> [ a[1], a[2] ] }




    #table1

    @tabelle1 = []
    @teams.each do |team|
      @points = 0
      @goalsScored = 0
      @goalsConceded = 0
      team.matches.each do |m|

        m.real_result = 0
        m.corrections.each do |c|
          if c.typeOfCorrection == 0 || c.typeOfCorrection == 1
            if m.mirror == false
              m.real_result += c.change
            else
              m.real_result += c.mirrorchange
            end
          end
        end

        # points
        if m.team1goals > m.team2goals
          @points += 3
        elsif m.team1goals == m.team2goals
          @points += 1
        end

        # goals
        @goalsScored += m.team1goals
        @goalsConceded += m.team2goals
      end
      @goalDifference = @goalsScored - @goalsConceded
      @tabelle1.push([team.name, @points, @goalDifference, @goalsScored, @goalsConceded, team.id])
    end

    @tabelle1.sort!  { |a,b| [ b[1], b[2] ] <=> [ a[1], a[2] ] }




    #table2

    @tabelle2 = []
    @teams.each do |team|
      @points = 0
      @goalsScored = 0
      @goalsConceded = 0
      team.matches.each do |m|

        m.real_result = 0
        m.corrections.each do |c|
          if c.typeOfCorrection == 0 || c.typeOfCorrection == 2
            if m.mirror == false
              m.real_result += c.change
            else
              m.real_result += c.mirrorchange
            end
          end
        end

        # points
        if m.team1goals > m.team2goals
          @points += 3
        elsif m.team1goals == m.team2goals
          @points += 1
        end

        # goals
        @goalsScored += m.team1goals
        @goalsConceded += m.team2goals
      end
      @goalDifference = @goalsScored - @goalsConceded
      @tabelle2.push([team.name, @points, @goalDifference, @goalsScored, @goalsConceded, team.id])
    end

    @tabelle2.sort!  { |a,b| [ b[1], b[2] ] <=> [ a[1], a[2] ] }




    #table3

    @tabelle3 = []
    @teams.each do |team|
      @points = 0
      @goalsScored = 0
      @goalsConceded = 0
      team.matches.each do |m|

        m.real_result = 0
        m.corrections.each do |c|
          if c.typeOfCorrection == 0 || c.typeOfCorrection == 3
            if m.mirror == false
              m.real_result += c.change
            else
              m.real_result += c.mirrorchange
            end
          end
        end

        # points
        if m.team1goals > m.team2goals
          @points += 3
        elsif m.team1goals == m.team2goals
          @points += 1
        end

        # goals
        @goalsScored += m.team1goals
        @goalsConceded += m.team2goals
      end
      @goalDifference = @goalsScored - @goalsConceded
      @tabelle3.push([team.name, @points, @goalDifference, @goalsScored, @goalsConceded, team.id])
    end

    @tabelle3.sort!  { |a,b| [ b[1], b[2] ] <=> [ a[1], a[2] ] }




    @mastertabelle = []
    @tabelle0.count.times do |x|
      @mastertabelle.push([@tabelle0[x], @tabelle1[x], @tabelle2[x], @tabelle3[x]])
    end

  end

  def addteam
    @team = Team.find(params[:team_id])
    @league.teams.push(@team)
    redirect_to @league
  end

  # GET /leagues/new
  def new
    @league = League.new
  end

  # GET /leagues/1/edit
  def edit
  end

  # POST /leagues
  # POST /leagues.json
  def create
    @league = League.new(league_params)

    respond_to do |format|
      if @league.save
        format.html { redirect_to @league, notice: 'League was successfully created.' }
        format.json { render :show, status: :created, location: @league }
      else
        format.html { render :new }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leagues/1
  # PATCH/PUT /leagues/1.json
  def update
    respond_to do |format|
      if @league.update(league_params)
        format.html { redirect_to @league, notice: 'League was successfully updated.' }
        format.json { render :show, status: :ok, location: @league }
      else
        format.html { render :edit }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leagues/1
  # DELETE /leagues/1.json
  def destroy
    @league.destroy
    respond_to do |format|
      format.html { redirect_to leagues_url, notice: 'League was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_league
      @league = League.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def league_params
      params.require(:league).permit(:name, :endyear)
    end
end
