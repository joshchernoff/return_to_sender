# ReturnToSender

A call bot to call back the people who keep calling you. 
I made this bot because I kept getting solicitation calls even though I've asked countless times for them to stop calling me. My phone would ring from a different number each time so it would not matter if I blocked it. 3 times a day they would call and even just hang up on me. 

So I created a return to sender. If these people can call me and harass me calling several times a day then why would  I not do the same to them.

This application is strictly for learning purposes, you take full and independent responsibility for using this app, I give no warranty or any support at all. Use at your own will. Be aware that using this app maybe in violation of the law depending on your location. You should understand the risks involved before using this.

## Instructions. 
Go get a twilio account and provide the replacement for the fixme in the `.env` file. 

```
export TWILIO_ACCOUNT_SID=FIX_ME
export TWILIO_AUTH_TOKEN=FIX_ME
```

Also get a pool of numbers you can call from and update the `.iex.es` file. 
```
bad_people_phone_numbers = [
  "+13333333333",
]

my_number_pool = [
  "+15555555555"
]
```
A note about the functions in `.iex.es`
We use `Enum.zip` to stitch the two list together. This requires you have an equal number of items in each list. 

For example you have a much bigger list of one vs the other. Just duplicate rows to make them equal in size. 
Example. 

```
bad_people_phone_numbers = [
  "+11111111111",
  "+22222222222",
  "+33333333333"
]

my_number_pool = [
  "+6666666666",
  "+6666666666",
  "+5555555555",
]
```

Noticed I just duplicated the `6666666666` number. Thats because this will be the output of `call_numbers`
```
[
  {"+11111111111", "+6666666666"}, 
  {"+22222222222", "+6666666666"},
  {"+33333333333", "+5555555555"}
]
```


Provide a list of number to which you will be calling from your twilio account and provide a list of number that you will be calling. 

From there before you run the application source your `.env` file to include your Env vars. 
```
$ source .env
```

Then start the application. 
```
iex -S mix
```

From in IEx you can run this command to start a background job to call your list of numbers. 
```
call_list |> ReturnToSender.CallProducer.call_numbers()
```

Note the message that plays is located in the `lib/return_to_sender/caller.ex` file.
```
"<Response><Say>Stop calling me you jack ass</Say><Record playBeep='false' /></Response>",
```
