require './app/models/user.rb'

describe User do
  subject (:user) {described_class.new("Moses")}

    context "#name" do
      it "returns the name that has been input" do
        expect(user.name).to eq("Moses")
      end
    end

end
