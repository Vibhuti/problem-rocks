class ProblemsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  before_action :set_problem, only: [:show, :edit, :update, :destroy]

  # GET /problems
  # GET /problems.json
  def index
    if params.has_key?("/problems")
      name = params["/problems"][:search]
      @problems = Problem.search(name)
    else
    @problems = Problem.all
    end
  end

  # GET /problems/1
  # GET /problems/1.json
  def show
  end

  # GET /problems/new
  def new
    @problem = Problem.new
    @solution = Solution.new
  end

  # GET /problems/1/edit
  def edit
    # @solution = @problem.solutions.first
  end

  # POST /problems
  # POST /problems.json
  def create
    # binding.pry
    @problem = Problem.new(problem_params)
    solution_content = params[:problem][:solution][:content]
    @problem.solutions << Solution.new(:content => solution_content)
    @problem.user_id = current_user.id

    # @solution = @problem.solutions.build(problem_params[:solution])

    respond_to do |format|
      if @problem.save
        format.html { redirect_to @problem, notice: 'Problem was successfully created.' }
        format.json { render :show, status: :created, location: @problem }
      else
        format.html { render :new }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /problems/1
  # PATCH/PUT /problems/1.json
  def update
    respond_to do |format|
      if @problem.update(problem_params)
        format.html { redirect_to @problem, notice: 'Problem was successfully updated.' }
        format.json { render :show, status: :ok, location: @problem }
      else
        format.html { render :edit }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /problems/1
  # DELETE /problems/1.json
  def destroy
    @problem.destroy
    respond_to do |format|
      format.html { redirect_to problems_url, notice: 'Problem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem
      @problem = Problem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def problem_params
      params.require(:problem).permit(:title, :public, :content, :user_id, :category, :solutions_attributes => [:content, :problem_id])
    end

end
