# future_or

A collection of widgets, methods and extension methods that make working with FutureOr objects easier

### Extension methods

#### Getters

1. `isFuture` : true if future
2. `isNotFuture` : true if value
3. `value` : casts to a value
4. `future` : casts to a future
5. `asFuture` : if not a future, returns Future.value of the value



### FutureOrBuilder
if the futureOr is a value, calls the builder with the value.
if the futureOr is a future, return a `FutureBuilder` widget.