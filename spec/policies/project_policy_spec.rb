require 'rails_helper'

describe ProjectPolicy do
  subject { described_class.new(user, project) }

  context 'with a owner accessing a public project' do
    let(:user) { build(:user) }
    let(:project) { build(:public_project, owner: user) }
    
    it { is_expected.to permit_actions([:edit, :update, :destroy]) }  
  end

  context 'with a user accessing a public project' do
    let(:user) { build(:user) }
    let(:project) { build(:public_project) }
    
    it { is_expected.to forbid_actions([:edit, :update, :destroy]) }  
  end

  context 'with an administrator accessing a public project without ownership' do
    let(:user) { build(:admin) }
    let(:project) { build(:public_project) }

    it { is_expected.to permit_actions([:edit, :update, :destroy]) }
  end

  context 'with an administrator accessing a private project without ownership' do
    let(:user) { build(:admin) }
    let(:project) { build(:private_project) }

    it { is_expected.to permit_actions([:edit, :update, :destroy]) }
  end
end