# QuickSearch::LibGuidesDatabaseSearcher

LibGuides Databases searcher for NCSU Quick Search

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'quick_search-lib_guides_database_searcher'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install quick_search-lib_guides_database_searcher
```

## Configuration

This searcher is designed to be configurable exclusively through environment
variables:

- [LIB_GUIDES_DATABASE_QUERY_TEMPLATE](#LIB_GUIDES_DATABASE_QUERY_TEMPLATE)
- [LIB_GUIDES_DATABASE_LOADED_LINK_TEMPLATE](#LIB_GUIDES_DATABASE_LOADED_LINK_TEMPLATE)
- [LIB_GUIDES_DATABASE_NO_RESULTS_LINK](#LIB_GUIDES_DATABASE_NO_RESULTS_LINK)

### LIB_GUIDES_DATABASE_QUERY_TEMPLATE

[RFC 6570] URI template for the LibGuides "API" search endpoint. The first
variable in the template will be set to the user's current query when executing
a search. Any additional variables will be ignored.

Example:

```
https://lib.guides.umd.edu/process/az/dbsearch?action=520&site_id=1504&is_widget=0{&search}
```

With a current query of "web of science", the searcher will request
https://lib.guides.umd.edu/process/az/dbsearch?action=520&site_id=1504&is_widget=0&search=web+of+science

⚠️ This is not a published LibGuides API. The searcher assumes that this is the
link that returns JSON with embedded HTML of the search results. It will attempt
to parse that HTML to extract the titles, descriptions, and links.

Assumed HTML structure for each search result (irrelevant elements and attributes
removed for clarity):

```html
<div class="s-lg-az-result">
    <div class="s-lg-az-result-title">
        <a href="LINK">TITLE</a>
    </div>
    <div class="s-lg-az-result-description">
        DESCRIPTION
    </div>
</div>
```

### LIB_GUIDES_DATABASE_LOADED_LINK_TEMPLATE

[RFC 6570] URI template for the LibGuides search page. The first variable in the
template will be set to the user's current query when executing a search. Any
additional variables will be ignored.

Example:

```
https://lib.guides.umd.edu/az.php{?q}
```

With a current query of "web of science", the searcher will request
https://lib.guides.umd.edu/az.php?q=web+of+science

### LIB_GUIDES_DATABASE_NO_RESULTS_LINK

URL to link to when there are no search results for the user's current query.

## License

See the [LICENSE](LICENSE) file for license rights and limitations (Apache 2.0).

[RFC 6570]: https://datatracker.ietf.org/doc/html/rfc6570
