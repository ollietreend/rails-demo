# Rails 7 bug demo

This is a minimal Rails 7 app created for the purpose of demonstrating a bug in ActiveModel.

## Getting started

1. Clone repo
2. Install dependencies:
    ```
    $ bundle install
    ```
3. Create and seed SQLite database:
    ```
    $ bundle exec rails db:setup
    ```

    > This could take a minute – [seeds.rb](db/seeds.rb) creates 10,000 database records.
4. Open an interactive Rails console:
    ```
    $ bundle exec rails console
    ```
5. Compare benchmarks:
    ```ruby
    # Rails 7 behaviour
    Benchmark.measure { Widget.all.map(&:attribute_names) }

    # Rails 6 behaviour
    Benchmark.measure { PatchedWidget.all.map(&:attribute_names) }
    ```

## Benchmark results

Performed on an Intel Core i7 powered MacBook Pro.

### Rails 7 behaviour

```
> Benchmark.measure { Widget.all.map(&:attribute_names) }
  Widget Load (46.7ms)  SELECT "widgets".* FROM "widgets"
=> 
#<Benchmark::Tms:0x0000000115ca71a8
 @cstime=0.0,
 @cutime=0.0,
 @label="",
 @real=3.254345999972429,
 @stime=1.6684130000000001,
 @total=3.249683,
 @utime=1.58127>
```

 ### Rails 6 behaviour

```
> Benchmark.measure { PatchedWidget.all.map(&:attribute_names) }

  PatchedWidget Load (53.7ms)  SELECT "widgets".* FROM "widgets"
=> 
#<Benchmark::Tms:0x00000001130c5490
 @cstime=0.0,
 @cutime=0.0,
 @label="",
 @real=0.23361299996031448,
 @stime=0.030952999999999342,
 @total=0.23303399999999908,
 @utime=0.20208099999999973>
```
