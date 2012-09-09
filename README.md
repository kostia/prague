# Prague

* You have a Rails app
* You want to add pages like "About Us", "Disclamer" etc.
* You want that pages to be editable at any time
* You want that pages to be accessible by a permalink
* You DON'T want to write models, controllers etc. every time in every app

Prague will generate all that for you!

## Installation

```ruby
# Gemfile
gem 'prague'
```

## Usage

```bash
$ rails g prague:scaffold
$ rake db:migrate
```

Now open `http://localhost:3000/pages` and create a new page with permalink `test`,
set it online and open `http://localhost:3000/test`.

For futher details see:

```bash
$ rails g prague:scaffold --help
```

and inspect the RDoc of generated classes and templates.

## License

Copyright (c) 2012 Kostiantyn Kahanskyi

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

