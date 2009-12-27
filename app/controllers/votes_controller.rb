class VotesController < ApplicationController

  hobo_model_controller

  auto_actions :show
  auto_actions_for :question, [:index,:new,:create]

end
