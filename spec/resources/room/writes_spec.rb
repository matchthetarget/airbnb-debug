require "rails_helper"

RSpec.describe RoomResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "rooms",
          attributes: {},
        },
      }
    end

    let(:instance) do
      RoomResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Room.count }.by(1)
    end
  end

  describe "updating" do
    let!(:room) { create(:room) }

    let(:payload) do
      {
        data: {
          id: room.id.to_s,
          type: "rooms",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      RoomResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { room.reload.updated_at }
      # .and change { room.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:room) { create(:room) }

    let(:instance) do
      RoomResource.find(id: room.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Room.count }.by(-1)
    end
  end
end
