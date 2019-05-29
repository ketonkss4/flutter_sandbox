class Repo {
  final int id;
  final Owner owner;
  final String name;
  final String description;
  final String htmlUrl;
  final int stargazersCount;

  Repo(this.id, this.owner, this.name, this.description, this.htmlUrl,
      this.stargazersCount);

  Repo.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        owner = Owner.fromJson(json["owner"]),
        name = json["name"],
        description = json["description"],
        htmlUrl = json["html_url"],
        stargazersCount = json["stargazers_count"];
}

class Owner {
  final int id;
  final String avatarUrl;

  Owner(this.id, this.avatarUrl);

  Owner.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        avatarUrl = json["avatar_url"];
}
