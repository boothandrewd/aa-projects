json.array! @guests.where("age BETWEEN 40 AND 50"), partial: 'api/guests/guest', as: :guest
