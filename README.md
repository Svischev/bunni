# bunni, a Ruby RabbitMQ Client

bunni is a RabbitMQ client that focuses on ease of use. It
is feature complete, supports all recent RabbitMQ features and does not
have any heavyweight dependencies.


## I Know What RabbitMQ and bunni are, How Do I Get Started?

[Right here](http://rubybunni.info/articles/getting_started.html)!


## What is bunni Good For?

One can use bunni to make Ruby applications interoperate with other
applications (both built in Ruby and not). Complexity and size may vary from
simple work queues to complex multi-stage data processing workflows that involve
many applications built with all kinds of technologies.

Specific examples:

 * Events collectors, metrics & analytics applications can aggregate events produced by various applications
   (Web and not) in the company network.

 * A Web application may route messages to a Java app that works
   with SMS delivery gateways.

 * MMO games can use flexible routing RabbitMQ provides to propagate event notifications to players and locations.

 * Price updates from public markets or other sources can be distributed between interested parties, from trading systems to points of sale in a specific geographic region.

 * Content aggregators may update full-text search and geospatial search indexes
   by delegating actual indexing work to other applications over RabbitMQ.

 * Companies may provide streaming/push APIs to their customers, partners
   or just general public.

 * Continuous integration systems can distribute builds between multiple machines with various hardware and software
   configurations using advanced routing features of RabbitMQ.

 * An application that watches updates from a real-time stream (be it markets data
   or Twitter stream) can propagate updates to interested parties, including
   Web applications that display that information in the real time.



## Supported Ruby Versions

Modern bunni versions support

 * CRuby 2.0 through 2.4

bunni works sufficiently well on JRuby but there are known
JRuby bugs in versions prior to JRuby 9000 that cause high CPU burn. JRuby users should
use [March Hare](http://rubymarchhare.info).

bunni `1.7.x` was the last version to support CRuby 1.9.3 and 1.8.7


## Supported RabbitMQ Versions

bunni `1.5.0` and later versions only support RabbitMQ `3.3+`.
bunni `1.4.x` and earlier supports RabbitMQ 2.x and 3.x.


## Project Maturity

bunni is a mature library (started in early 2009) with
a stable public API.


## Installation & Bundler Dependency

### Most Recent Release

[![Gem Version](https://badge.fury.io/rb/bunni.svg)](http://badge.fury.io/rb/bunni)

### With Rubygems

To install bunni with RubyGems:

```
gem install bunni
```

### Bundler Dependency

To use bunni in a project managed with Bundler:

``` ruby
gem "bunni", ">= 2.7.0"
```


## Quick Start

Below is a small snippet that demonstrates how to publish
and synchronously consume ("pull API") messages with bunni.

For a 15 minute tutorial using more practical examples, see [Getting Started with RabbitMQ and Ruby using bunni](http://rubybunni.info/articles/getting_started.html).

``` ruby
require "bunni"

# Start a communication session with RabbitMQ
conn = Bunni.new
conn.start

# open a channel
ch = conn.create_channel

# declare a queue
q  = ch.queue("test1")

# publish a message to the default exchange which then gets routed to this queue
q.publish("Hello, everybody!")

# fetch a message from the queue
delivery_info, metadata, payload = q.pop

puts "This is the message: #{payload}"

# close the connection
conn.stop
```


## Documentation

### Getting Started

For a 15 minute tutorial using more practical examples, see [Getting Started with RabbitMQ and Ruby using bunni](http://rubybunni.info/articles/getting_started.html).

### Guides

Other documentation guides are available at [rubybunni.info](http://rubybunni.info):

 * [Queues and Consumers](http://rubybunni.info/articles/queues.html)
 * [Exchanges and Publishers](http://rubybunni.info/articles/exchanges.html)
 * [AMQP 0.9.1 Model Explained](http://www.rabbitmq.com/tutorials/amqp-concepts.html)
 * [Connecting to RabbitMQ](http://rubybunni.info/articles/connecting.html)
 * [Error Handling and Recovery](http://rubybunni.info/articles/error_handling.html)
 * [TLS/SSL Support](http://rubybunni.info/articles/tls.html)
 * [Bindings](http://rubybunni.info/articles/bindings.html)
 * [Using RabbitMQ Extensions with bunni](http://rubybunni.info/articles/extensions.html)
 * [Durability and Related Matters](http://rubybunni.info/articles/durability.html)

### API Reference

[bunni API Reference](http://reference.rubybunni.info/).


## Community and Getting Help

### Mailing List

[bunni has a mailing list](http://groups.google.com/group/ruby-amqp). We encourage you
to also join the [RabbitMQ mailing list](https://groups.google.com/forum/#!forum/rabbitmq-users) mailing list. Feel free to ask any questions that you may have.


## Continuous Integration

[![Build Status](https://travis-ci.org/ruby-amqp/bunni.png)](https://travis-ci.org/ruby-amqp/bunni/)


### News & Announcements on Twitter

To subscribe for announcements of releases, important changes and so on, please follow [@rubyamqp](https://twitter.com/#!/rubyamqp) on Twitter.

More detailed announcements can be found in the [RabbitMQ Ruby clients blog](http://blog.rubyrabbitmq.info).


### Reporting Issues

If you find a bug, poor default, missing feature or find any part of
the API inconvenient, please [file an
issue](http://github.com/ruby-amqp/bunni/issues) on GitHub.  When
filing an issue, please specify which bunni and RabbitMQ versions you
are using, provide recent RabbitMQ log file contents if possible, and
try to explain what behavior you expected and why. Bonus points for
contributing failing test cases.


## Other Ruby RabbitMQ Clients

The other widely used Ruby RabbitMQ client is [March Hare](http://rubymarchhare.info) (JRuby-only).
It's a mature library that require RabbitMQ 3.3.x or later.


## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for more information
about running various test suites.


## License

Released under the MIT license.
