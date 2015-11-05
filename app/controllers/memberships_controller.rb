class MembershipsController < ApplicationController
  def create
    # For Kurtis to write
    @group = Group.find(params[:group_id])
    @user  = User.find(params[:user_id])

    if !@group.users.include?(@user)
      @membership = @group.memberships.create(user: @user)
    end
  end

  def destroy
    @membership = Membership.find(params[:id])
    @group = @membership.group

    @membership.destroy
  end
end
