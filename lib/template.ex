defmodule Journal.Template do
  import Journal.FileManager

  def blank do
    new()
  end

  def bullet_day do
    new(
      "bullet journal day",
"## I am grateful for:
- 
- 
- 

## What would make today great?
- 
- 
- 


## Daily affirmations. I am…
- 
- 
"
    )
  end

  def bullet_night do
    new(
      "bullet journal night",
"## Amazing things that happened today…
- 
- 
- 

## How could I have made today even better?
- 
- 
- 
"
    )
  end
end
