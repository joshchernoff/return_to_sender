bad_people_phone_numbers = [
  "+13333333333",
]

my_number_pool = [
  "+15555555555"
]

call_list =
  bad_people_phone_numbers
  |> Enum.shuffle()
  |> Enum.zip(my_number_pool)
