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
    Benchmark.ms { Widget.all.map(&:attribute_names) }

    # Rails 6 behaviour
    Benchmark.ms { PatchedWidget.all.map(&:attribute_names) }
    ```

## Benchmark results

Performed on an M1 MacBook Pro.

### Rails 7 behaviour

```
> Benchmark.ms { Widget.all.map(&:attribute_names) }
  Widget Load (282.7ms)  SELECT "widgets".* FROM "widgets"
=> 22544.85599999316
```

### Rails 6 behaviour

```
> Benchmark.ms { PatchedWidget.all.map(&:attribute_names) }
  PatchedWidget Load (122.0ms)  SELECT "widgets".* FROM "widgets"
=> 189.2470000020694
```
