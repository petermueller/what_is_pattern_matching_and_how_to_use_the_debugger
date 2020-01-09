footer: © Peter Mueller, 2019
slidenumbers: true

## What is Pattern Matching
### _**and How to Use the Debugger**_
![fit, original](elixir-logo.png)

---

### Peter Mueller

- ![](Twitter_Logo_WhiteOnImage.png) _@felix\_starman_
- ![](GitHub-Mark-Light-64px.png) _felix-starman_
- slides at: [gh/felix-starman/what\_is\_pattern_(...)](https://github.com/felix-starman/what_is_pattern_matching_and_how_to_use_the_debugger)

---
[.code: auto(47)]
## Pattern Matching
### First let's talk about _"assignment"_

```javascript
// javascript
let some_var = ["menuItem", 37, "Crunchy Frog"]
```
```ruby
# ruby
some_var = [:menu_item, 37, "Crunchy Frog"]
```
```elixir
# elixir
some_var = [:menu_item, 37, "Crunchy Frog"]
```

---
[.code: auto(47)]

## Pattern Matching
### There is even _**multiple-assignment**_ in some languages

[.code-highlight: all]
[.code-highlight: none]
```javascript
// javascript: destructuring assignment
[type, id, title] = ["menuItem", 37, "Crunchy Frog"]
```
[.code-highlight: none]
[.code-highlight: all]
[.code-highlight: none]
```ruby
# ruby: multiple-assignment
[type, id, title]  = [:menu_item, 37, "Crunchy Frog"]
```
[.code-highlight: none]
[.code-highlight: all]
```elixir
# elixir: matching "assignment"
[type, id, title]  = [:menu_item, 37, "Crunchy Frog"]
```

---

[.code: auto(47)]
## Pattern Matching
### But _**"Matching"**_ is not quite _**assignment**_

[.code-highlight: 2]
[.code-highlight: 3]
[.code-highlight: 4]
[.code-highlight: 6]
[.code-highlight: 7]
```elixir
# elixir
fav_fruit = %{apples: ["Honey Crisp", "Granny Smith"]}
%{apples: apples} = fav_fruit
apples # ["Honey Crisp", "Granny Smith"]

%{durian: true} = fav_fruit
# (MatchError) no match of right hand side value: %{apples: ["Honey Crisp", "Granny Smith"]}
```

---

[.code: auto(47)]
## Pattern Matching
### You can match on the shape, but assign **nothing**

[.code-highlight: 1-2]
[.code-highlight: 3]
[.code-highlight: 4]
[.code-highlight: 6]
```elixir
# Maps
%{username: _} = user_session
%{username: _, admin: true} = user_session
%{username: "demosthenes"} = user_session

%{author: ^current_user} = article
```

---

[.code: auto(47)]
## Matching on other data structures
[.code-highlight: 1-2]
[.code-highlight: 4-5]
[.code-highlight: 7-8]
```elixir
# Strings
"NAME=" <> name = commandline_args # String matching

# Lists
[un, pw] = String.split("my_user:password1", ":")

# Tuples
{:ok, result} = VeryImportantThing.do_it()
```

---

[.code: auto(47)]
## Matching in function definitions
#### Little ugly
[.code-highlight: all]
[.code-highlight: 2,4,10]
[.code-highlight: 2-4,10]
[.code-highlight: 2,4-10]
[.code-highlight: 4-10]
[.code-highlight: 5,6]
[.code-highlight: 7,8]
[.code-highlight: 2,4,5,7,8]
[.code-highlight: all]

```elixir
def authorized?(conn) do
  if conn.admin do
    true
  else
    if conn.current_user == conn.owner_of_thing do
      true
    else
      false
    end
  end
end

```

---

[.code: auto(47)]
## Matching in function definitions
#### Awwwwwww yeaaaah

[.code-highlight: all]
[.code-highlight: 1,5,6]
[.code-highlight: 2,5,6]
[.code-highlight: 3,5,6]
[.code-highlight: all]
```elixir
def authorized?(%{admin: true}), do: true
def authorized?(%{owner: user, current_user: user}), do: true
def authorized?(_), do: false

# These are "definitions" for ONE function (`authorized?/1`)
# Patterns are evaluated in the order they are defined
```

---

# Debugger

![right fit](do_it_live.jpg)
