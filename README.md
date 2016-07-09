What's ?
===============
chef で使用する EC2インスタンス起動時に自分の Nameタグ をDNSレコードとしてRoute53に登録する cookbook です。
EIPを使わない場合やインスタンス数が増減する場合に Route53 に各インスタンスが自分を登録することにより管理を楽にするのが目的。

Usage
-----
cookbook なので berkshelf で取ってきて使いましょう。

* Berksfile
```ruby
source "https://supermarket.chef.io"

cookbook "host2r53", git: "https://github.com/bageljp/cookbook-host2r53.git"
```

```
berks vendor
```

#### Role and Environment attributes

* sample_role.rb
```ruby
override_attributes(
  "host2r53" => {
    "domain" => "example.com"
  }
)
```

指定するドメインはRoute53で管理されていること。
これをインストールするインスタンスは aws-cli にて Route53 のレコード変更が可能なこと（要IAM Role）。

Recipes
----------

#### host2r53::default
Route53 に Nameタグ のDNSレコードを登録する起動スクリプトの設定。

Attributes
----------

多分 Usage のサンプルの記載見ればわかると思います。

