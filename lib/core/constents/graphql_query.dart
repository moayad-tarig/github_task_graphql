const String popularRepositoryQuery = r'''{
  search(query: "stars:>10000", type: REPOSITORY, first: 10) {
    edges {
      node {
        ... on Repository {
          name
          description
          primaryLanguage {
            name
          }
          stargazerCount
          url
        }
      }
    }
  }
}
''';