{
    "description": "このスキーマ定義では、Qiita API v2 のインターフェースをJSON Hyper Schema draft v4形式で表現しています。",
    "properties": {
        "access_token": {
            "description": "Qiita API v2で認証・認可を行うためのアクセストークンを表します。",
            "links": [
                {
                    "description": "与えられた認証情報をもとに新しいアクセストークンを発行します。",
                    "href": "/api/v2/access_tokens",
                    "method": "POST",
                    "rel": "create",
                    "schema": {
                        "properties": {
                            "client_id": {
                                "description": "登録されたAPIクライアントを特定するためのID",
                                "example": "a91f0396a0968ff593eafdd194e3d17d32c41b1da7b25e873b42e9058058cd9d",
                                "pattern": "^[0-9a-f]{40}$",
                                "type": "string"
                            },
                            "client_secret": {
                                "description": "登録されたAPIクライアントを認証するための秘密鍵",
                                "example": "01fc259c31fe39e72c8ef911c3432a33d51e9337ff34c4fac86c491a0d37251f",
                                "pattern": "^[0-9a-f]{40}$",
                                "type": "string"
                            },
                            "code": {
                                "description": "リダイレクト用のURLに付与された、アクセストークンと交換するための文字列",
                                "example": "fefef5f067171f247fb415e38cb0631797b82f4141dcdee66db846c3ade57a03",
                                "pattern": "^[0-9a-f]{40}$",
                                "type": "string"
                            }
                        },
                        "required": [
                            "client_id",
                            "client_secret",
                            "code"
                        ]
                    },
                    "title": "create_access_token"
                },
                {
                    "description": "指定されたアクセストークンを失効させ、それ以降利用できないようにします。",
                    "href": "/api/v2/access_tokens/:access_token",
                    "mediaType": "null",
                    "method": "DELETE",
                    "rel": "delete",
                    "title": "delete_access_token"
                }
            ],
            "properties": {
                "client_id": {
                    "description": "登録されたAPIクライアントを特定するためのID",
                    "example": "a91f0396a0968ff593eafdd194e3d17d32c41b1da7b25e873b42e9058058cd9d",
                    "pattern": "^[0-9a-f]{40}$",
                    "type": "string"
                },
                "scopes": {
                    "description": "アクセストークンに許された操作の一覧",
                    "items": {
                        "example": "read_qiita",
                        "type": "string"
                    },
                    "type": "array"
                },
                "token": {
                    "description": "アクセストークンを表現する文字列",
                    "example": "ea5d0a593b2655e9568f144fb1826342292f5c6b7d406fda00577b8d1530d8a5",
                    "pattern": "^[0-9a-f]{40}$",
                    "type": "string"
                }
            },
            "required": [
                "client_id",
                "scopes",
                "token"
            ],
            "title": "アクセストークン"
        },
        "authenticated_user": {
            "description": "現在のアクセストークンで認証中のユーザを表します。通常のユーザ情報よりも詳細な情報を含んでいます。",
            "links": [
                {
                    "description": "アクセストークンに紐付いたユーザを返します。",
                    "href": "/api/v2/authenticated_user",
                    "method": "GET",
                    "rel": "self",
                    "title": "get_authenticated_user"
                }
            ],
            "properties": {
                "description": {
                    "description": "自己紹介文",
                    "example": "Hello, world.",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                "facebook_id": {
                    "description": "Facebook ID",
                    "example": "yaotti",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                "followees_count": {
                    "description": "このユーザがフォローしているユーザの数",
                    "example": 100,
                    "type": "integer"
                },
                "followers_count": {
                    "description": "このユーザをフォローしているユーザの数",
                    "example": 200,
                    "type": "integer"
                },
                "github_login_name": {
                    "description": "GitHub ID",
                    "example": "yaotti",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                "id": {
                    "description": "ユーザID",
                    "example": "yaotti",
                    "type": "string"
                },
                "image_monthly_upload_limit": {
                    "description": "1ヶ月あたりにQiitaにアップロードできる画像の総容量",
                    "example": 1048576,
                    "type": "integer"
                },
                "image_monthly_upload_remaining": {
                    "description": "その月にQiitaにアップロードできる画像の残りの容量",
                    "example": 524288,
                    "type": "integer"
                },
                "items_count": {
                    "description": "このユーザが qiita.com 上で公開している投稿の数 (Qiita:Teamでの投稿数は含まれません)",
                    "example": 300,
                    "type": "integer"
                },
                "linkedin_id": {
                    "description": "LinkedIn ID",
                    "example": "yaotti",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                "location": {
                    "description": "居住地",
                    "example": "Tokyo, Japan",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                "name": {
                    "description": "設定している名前",
                    "example": "Hiroshige Umino",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                "organization": {
                    "description": "所属している組織",
                    "example": "Increments Inc",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                "permanent_id": {
                    "description": "ユーザごとに割り当てられる整数のID",
                    "example": 1,
                    "type": "integer"
                },
                "profile_image_url": {
                    "description": "設定しているプロフィール画像のURL",
                    "example": "https://si0.twimg.com/profile_images/2309761038/1ijg13pfs0dg84sk2y0h_normal.jpeg",
                    "type": "string"
                },
                "team_only": {
                    "description": "Qiita:Team専用モードに設定されているかどうか",
                    "example": false,
                    "type": "boolean"
                },
                "twitter_screen_name": {
                    "description": "Twitterのスクリーンネーム",
                    "example": "yaotti",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                "website_url": {
                    "description": "設定しているWebサイトのURL",
                    "example": "http://yaotti.hatenablog.com",
                    "type": [
                        "null",
                        "string"
                    ]
                }
            },
            "required": [
                "description",
                "facebook_id",
                "followees_count",
                "followers_count",
                "github_login_name",
                "id",
                "items_count",
                "linkedin_id",
                "location",
                "name",
                "organization",
                "permanent_id",
                "profile_image_url",
                "twitter_screen_name",
                "website_url",
                "image_monthly_upload_limit",
                "image_monthly_upload_remaining",
                "team_only"
            ],
            "title": "認証中のユーザ"
        },
        "comment": {
            "description": "投稿に付けられたコメントを表します。",
            "links": [
                {
                    "description": "コメントを削除します。",
                    "href": "/api/v2/comments/:comment_id",
                    "mediaType": "null",
                    "method": "DELETE",
                    "title": "delete_comment"
                },
                {
                    "description": "コメントを取得します。",
                    "href": "/api/v2/comments/:comment_id",
                    "method": "GET",
                    "title": "get_comment"
                },
                {
                    "description": "コメントを更新します。",
                    "href": "/api/v2/comments/:comment_id",
                    "method": "PATCH",
                    "schema": {
                        "properties": {
                            "body": {
                                "description": "コメントの内容を表すMarkdown形式の文字列",
                                "example": "# Example",
                                "type": "string"
                            }
                        },
                        "required": [
                            "body"
                        ]
                    },
                    "title": "update_comment"
                },
                {
                    "description": "コメントからThankを外します。",
                    "href": "/api/v2/comments/:comment_id/thank",
                    "method": "DELETE",
                    "title": "unthank_comment"
                },
                {
                    "description": "コメントにThankを付けます。",
                    "href": "/api/v2/comments/:comment_id/thank",
                    "method": "PUT",
                    "title": "thank_comment"
                },
                {
                    "description": "投稿に付けられたコメント一覧を投稿日時の降順で取得します。",
                    "href": "/api/v2/items/:item_id/comments",
                    "method": "GET",
                    "rel": "instances",
                    "title": "list_item_comments"
                },
                {
                    "description": "投稿に対してコメントを投稿します。",
                    "href": "/api/v2/items/:item_id/comments",
                    "method": "POST",
                    "schema": {
                        "properties": {
                            "body": {
                                "description": "コメントの内容を表すMarkdown形式の文字列",
                                "example": "# Example",
                                "type": "string"
                            }
                        },
                        "required": [
                            "body"
                        ]
                    },
                    "title": "create_item_comment"
                }
            ],
            "properties": {
                "body": {
                    "description": "コメントの内容を表すMarkdown形式の文字列",
                    "example": "# Example",
                    "type": "string"
                },
                "created_at": {
                    "description": "データが作成された日時",
                    "example": "2000-01-01T00:00:00+00:00",
                    "format": "date-time",
                    "type": "string"
                },
                "id": {
                    "description": "コメントの一意なID",
                    "example": "3391f50c35f953abfc4f",
                    "pattern": "^[0-9a-f]{20}$",
                    "type": "string"
                },
                "rendered_body": {
                    "description": "コメントの内容を表すHTML形式の文字列",
                    "example": "<h1>Example</h1>",
                    "type": "string"
                },
                "updated_at": {
                    "description": "データが最後に更新された日時",
                    "example": "2000-01-01T00:00:00+00:00",
                    "format": "date-time",
                    "type": "string"
                },
                "user": {
                    "description": "Qiita上のユーザを表します。",
                    "properties": {
                        "description": {
                            "description": "自己紹介文",
                            "example": "Hello, world.",
                            "type": [
                                "null",
                                "string"
                            ]
                        },
                        "facebook_id": {
                            "description": "Facebook ID",
                            "example": "yaotti",
                            "type": [
                                "null",
                                "string"
                            ]
                        },
                        "followees_count": {
                            "description": "このユーザがフォローしているユーザの数",
                            "example": 100,
                            "type": "integer"
                        },
                        "followers_count": {
                            "description": "このユーザをフォローしているユーザの数",
                            "example": 200,
                            "type": "integer"
                        },
                        "github_login_name": {
                            "description": "GitHub ID",
                            "example": "yaotti",
                            "type": [
                                "null",
                                "string"
                            ]
                        },
                        "id": {
                            "description": "ユーザID",
                            "example": "yaotti",
                            "type": "string"
                        },
                        "items_count": {
                            "description": "このユーザが qiita.com 上で公開している投稿の数 (Qiita:Teamでの投稿数は含まれません)",
                            "example": 300,
                            "type": "integer"
                        },
                        "linkedin_id": {
                            "description": "LinkedIn ID",
                            "example": "yaotti",
                            "type": [
                                "null",
                                "string"
                            ]
                        },
                        "location": {
                            "description": "居住地",
                            "example": "Tokyo, Japan",
                            "type": [
                                "null",
                                "string"
                            ]
                        },
                        "name": {
                            "description": "設定している名前",
                            "example": "Hiroshige Umino",
                            "type": [
                                "null",
                                "string"
                            ]
                        },
                        "organization": {
                            "description": "所属している組織",
                            "example": "Increments Inc",
                            "type": [
                                "null",
                                "string"
                            ]
                        },
                        "permanent_id": {
                            "description": "ユーザごとに割り当てられる整数のID",
                            "example": 1,
                            "type": "integer"
                        },
                        "profile_image_url": {
                            "description": "設定しているプロフィール画像のURL",
                            "example": "https://si0.twimg.com/profile_images/2309761038/1ijg13pfs0dg84sk2y0h_normal.jpeg",
                            "type": "string"
                        },
                        "twitter_screen_name": {
                            "description": "Twitterのスクリーンネーム",
                            "example": "yaotti",
                            "type": [
                                "null",
                                "string"
                            ]
                        },
                        "website_url": {
                            "description": "設定しているWebサイトのURL",
                            "example": "http://yaotti.hatenablog.com",
                            "type": [
                                "null",
                                "string"
                            ]
                        }
                    },
                    "required": [
                        "description",
                        "facebook_id",
                        "followees_count",
                        "followers_count",
                        "github_login_name",
                        "id",
                        "items_count",
                        "linkedin_id",
                        "location",
                        "name",
                        "organization",
                        "permanent_id",
                        "profile_image_url",
                        "twitter_screen_name",
                        "website_url"
                    ],
                    "title": "ユーザ"
                }
            },
            "required": [
                "body",
                "created_at",
                "id",
                "rendered_body",
                "updated_at",
                "user"
            ],
            "title": "コメント"
        },
        "expanded_template": {
            "description": "テンプレートを保存する前に変数展開後の状態をプレビューできます。Qiita:Teamでのみ有効です。",
            "links": [
                {
                    "description": "受け取ったテンプレート用文字列の変数を展開して返します。",
                    "href": "/api/v2/expanded_templates",
                    "method": "POST",
                    "rel": "create",
                    "schema": {
                        "properties": {
                            "body": {
                                "description": "テンプレートの本文",
                                "example": "Weekly MTG on %{Year}/%{month}/%{day}",
                                "type": "string"
                            },
                            "tags": {
                                "description": "タグ一覧",
                                "example": [
                                    {
                                        "name": "MTG/%{Year}/%{month}/%{day}",
                                        "versions": [
                                            "0.0.1"
                                        ]
                                    }
                                ],
                                "items": {
                                    "properties": {
                                        "name": {
                                            "type": "string"
                                        },
                                        "versions": {
                                            "items": {
                                                "type": "string"
                                            },
                                            "type": "array"
                                        }
                                    },
                                    "required": [
                                        "name"
                                    ]
                                },
                                "type": "array",
                                "uniqueItems": true
                            },
                            "title": {
                                "description": "生成される投稿のタイトルの雛形",
                                "example": "Weekly MTG on %{Year}/%{month}/%{day}",
                                "type": "string"
                            }
                        },
                        "required": [
                            "body",
                            "tags",
                            "title"
                        ]
                    },
                    "title": "create_expanded_template"
                }
            ],
            "properties": {
                "expanded_body": {
                    "description": "変数を展開した状態の本文",
                    "example": "Weekly MTG on 2000/01/01",
                    "type": "string"
                },
                "expanded_tags": {
                    "description": "変数を展開した状態のタグ一覧",
                    "example": [
                        {
                            "name": "MTG/2000/01/01",
                            "versions": [
                                "0.0.1"
                            ]
                        }
                    ],
                    "items": {
                        "properties": {
                            "name": {
                                "type": "string"
                            },
                            "versions": {
                                "items": {
                                    "type": "string"
                                },
                                "type": "array"
                            }
                        },
                        "required": [
                            "name"
                        ]
                    },
                    "type": "array",
                    "uniqueItems": true
                },
                "expanded_title": {
                    "description": "変数を展開した状態のタイトル",
                    "example": "Weekly MTG on 2015/06/03",
                    "type": "string"
                }
            },
            "required": [
                "expanded_body",
                "expanded_tags",
                "expanded_title"
            ],
            "title": "展開済みテンプレート"
        },
        "item": {
            "description": "ユーザからの投稿を表します。",
            "links": [
                {
                    "description": "認証中のユーザの投稿の一覧を作成日時の降順で返します。",
                    "href": "/api/v2/authenticated_user/items",
                    "method": "GET",
                    "rel": "instances",
                    "schema": {
                        "properties": {
                            "page": {
                                "description": "ページ番号 (1から100まで)",
                                "example": 1,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            },
                            "per_page": {
                                "description": "1ページあたりに含まれる要素数 (1から100まで)",
                                "example": 20,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            }
                        }
                    },
                    "title": "list_authenticated_user_items"
                },
                {
                    "description": "投稿の一覧を作成日時の降順で返します。",
                    "href": "/api/v2/items",
                    "method": "GET",
                    "rel": "instances",
                    "schema": {
                        "properties": {
                            "page": {
                                "description": "ページ番号 (1から100まで)",
                                "example": 1,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            },
                            "per_page": {
                                "description": "1ページあたりに含まれる要素数 (1から100まで)",
                                "example": 20,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            },
                            "query": {
                                "description": "検索クエリ",
                                "example": "qiita user:yaotti",
                                "type": "string"
                            }
                        }
                    },
                    "title": "list_items"
                },
                {
                    "description": "新たに投稿を作成します。",
                    "href": "/api/v2/items",
                    "method": "POST",
                    "rel": "create",
                    "schema": {
                        "properties": {
                            "body": {
                                "description": "Markdown形式の本文",
                                "example": "# Example",
                                "type": "string"
                            },
                            "coediting": {
                                "description": "この投稿が共同更新状態かどうか (Qiita:Teamでのみ有効)",
                                "example": false,
                                "type": "boolean"
                            },
                            "gist": {
                                "description": "本文中のコードをGistに投稿するかどうか (GitHub連携を有効化している場合のみ有効)",
                                "example": false,
                                "type": "boolean"
                            },
                            "private": {
                                "description": "限定共有状態かどうかを表すフラグ (Qiita:Teamでは無効)",
                                "example": false,
                                "type": "boolean"
                            },
                            "tags": {
                                "description": "投稿に付いたタグ一覧",
                                "example": [
                                    {
                                        "name": "Ruby",
                                        "versions": [
                                            "0.0.1"
                                        ]
                                    }
                                ],
                                "items": {
                                    "properties": {
                                        "name": {
                                            "type": "string"
                                        },
                                        "versions": {
                                            "items": {
                                                "type": "string"
                                            },
                                            "type": "array"
                                        }
                                    },
                                    "required": [
                                        "name"
                                    ],
                                    "type": "object"
                                },
                                "type": "array",
                                "uniqueItems": true
                            },
                            "title": {
                                "description": "投稿のタイトル",
                                "example": "Example title",
                                "type": "string"
                            },
                            "tweet": {
                                "description": "Twitterに投稿するかどうか (Twitter連携を有効化している場合のみ有効)",
                                "example": false,
                                "type": "boolean"
                            }
                        },
                        "required": [
                            "body",
                            "tags",
                            "title"
                        ]
                    },
                    "title": "create_item"
                },
                {
                    "description": "投稿を削除します。",
                    "href": "/api/v2/items/:item_id",
                    "method": "GET",
                    "rel": "delete",
                    "title": "delete_item"
                },
                {
                    "description": "投稿を取得します。",
                    "href": "/api/v2/items/:item_id",
                    "method": "GET",
                    "rel": "self",
                    "title": "get_item"
                },
                {
                    "description": "投稿を更新します。",
                    "href": "/api/v2/items/:item_id",
                    "method": "PATCH",
                    "schema": {
                        "properties": {
                            "body": {
                                "description": "Markdown形式の本文",
                                "example": "# Example",
                                "type": "string"
                            },
                            "coediting": {
                                "description": "この投稿が共同更新状態かどうか (Qiita:Teamでのみ有効)",
                                "example": false,
                                "type": "boolean"
                            },
                            "private": {
                                "description": "限定共有状態かどうかを表すフラグ (Qiita:Teamでは無効)",
                                "example": false,
                                "type": "boolean"
                            },
                            "tags": {
                                "description": "投稿に付いたタグ一覧",
                                "example": [
                                    {
                                        "name": "Ruby",
                                        "versions": [
                                            "0.0.1"
                                        ]
                                    }
                                ],
                                "items": {
                                    "properties": {
                                        "name": {
                                            "type": "string"
                                        },
                                        "versions": {
                                            "items": {
                                                "type": "string"
                                            },
                                            "type": "array"
                                        }
                                    },
                                    "required": [
                                        "name"
                                    ],
                                    "type": "object"
                                },
                                "type": "array",
                                "uniqueItems": true
                            },
                            "title": {
                                "description": "投稿のタイトル",
                                "example": "Example title",
                                "type": "string"
                            }
                        },
                        "required": [
                            "body",
                            "title"
                        ]
                    },
                    "title": "update_item"
                },
                {
                    "description": "投稿への「いいね！」を取り消します。Qiita:Teamでのみ有効です。",
                    "href": "/api/v2/items/:item_id/like",
                    "mediaType": "null",
                    "method": "DELETE",
                    "rel": "delete",
                    "title": "unlike_item"
                },
                {
                    "description": "投稿に「いいね！」を付けます。Qiita:Teamでのみ有効です。",
                    "href": "/api/v2/items/:item_id/like",
                    "mediaType": "null",
                    "method": "PUT",
                    "rel": "put",
                    "title": "like_item"
                },
                {
                    "description": "投稿をストックから取り除きます。",
                    "href": "/api/v2/items/:item_id/stock",
                    "mediaType": "null",
                    "method": "DELETE",
                    "rel": "delete",
                    "title": "unstock_item"
                },
                {
                    "description": "投稿をストックしているかどうかを調べます。",
                    "href": "/api/v2/items/:item_id/stock",
                    "method": "GET",
                    "rel": "check",
                    "title": "get_item_stock"
                },
                {
                    "description": "投稿をストックします。",
                    "href": "/api/v2/items/:item_id/stock",
                    "mediaType": "null",
                    "method": "PUT",
                    "rel": "put",
                    "title": "stock_item"
                },
                {
                    "description": "投稿をストックします。",
                    "href": "/api/v2/items/:item_id/stock",
                    "mediaType": "null",
                    "method": "PUT",
                    "rel": "put",
                    "title": "stock_item"
                },
                {
                    "description": "指定されたタグが付けられた投稿一覧を、タグを付けた日時の降順で返します。",
                    "href": "/api/v2/tags/:tag_id/items",
                    "method": "GET",
                    "rel": "instances",
                    "schema": {
                        "properties": {
                            "page": {
                                "description": "ページ番号 (1から100まで)",
                                "example": 1,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            },
                            "per_page": {
                                "description": "1ページあたりに含まれる要素数 (1から100まで)",
                                "example": 20,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            }
                        }
                    },
                    "title": "list_tag_items"
                },
                {
                    "description": "指定されたユーザの投稿一覧を、作成日時の降順で返します。",
                    "href": "/api/v2/users/:user_id/items",
                    "method": "GET",
                    "rel": "instances",
                    "schema": {
                        "properties": {
                            "page": {
                                "description": "ページ番号 (1から100まで)",
                                "example": 1,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            },
                            "per_page": {
                                "description": "1ページあたりに含まれる要素数 (1から100まで)",
                                "example": 20,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            }
                        }
                    },
                    "title": "list_user_items"
                },
                {
                    "description": "指定されたユーザがストックした投稿一覧を、ストックした日時の降順で返します。",
                    "href": "/api/v2/users/:user_id/stocks",
                    "method": "GET",
                    "rel": "instances",
                    "schema": {
                        "properties": {
                            "page": {
                                "description": "ページ番号 (1から100まで)",
                                "example": 1,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            },
                            "per_page": {
                                "description": "1ページあたりに含まれる要素数 (1から100まで)",
                                "example": 20,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            }
                        }
                    },
                    "title": "list_user_stocks"
                }
            ],
            "properties": {
                "body": {
                    "description": "Markdown形式の本文",
                    "example": "# Example",
                    "type": "string"
                },
                "coediting": {
                    "description": "この投稿が共同更新状態かどうか (Qiita:Teamでのみ有効)",
                    "example": false,
                    "type": "boolean"
                },
                "created_at": {
                    "description": "データが作成された日時",
                    "example": "2000-01-01T00:00:00+00:00",
                    "format": "date-time",
                    "type": "string"
                },
                "id": {
                    "description": "投稿の一意なID",
                    "example": "4bd431809afb1bb99e4f",
                    "pattern": "^[0-9a-f]{20}$",
                    "type": "string"
                },
                "private": {
                    "description": "限定共有状態かどうかを表すフラグ (Qiita:Teamでは無効)",
                    "example": false,
                    "type": "boolean"
                },
                "rendered_body": {
                    "description": "HTML形式の本文",
                    "example": "<h1>Example</h1>",
                    "type": "string"
                },
                "tags": {
                    "description": "投稿に付いたタグ一覧",
                    "example": [
                        {
                            "name": "Ruby",
                            "versions": [
                                "0.0.1"
                            ]
                        }
                    ],
                    "items": {
                        "properties": {
                            "name": {
                                "type": "string"
                            },
                            "versions": {
                                "items": {
                                    "type": "string"
                                },
                                "type": "array"
                            }
                        },
                        "required": [
                            "name"
                        ],
                        "type": "object"
                    },
                    "type": "array",
                    "uniqueItems": true
                },
                "title": {
                    "description": "投稿のタイトル",
                    "example": "Example title",
                    "type": "string"
                },
                "updated_at": {
                    "description": "データが最後に更新された日時",
                    "example": "2000-01-01T00:00:00+00:00",
                    "format": "date-time",
                    "type": "string"
                },
                "url": {
                    "description": "投稿のURL",
                    "example": "https://qiita.com/yaotti/items/4bd431809afb1bb99e4f",
                    "type": "string"
                },
                "user": {
                    "description": "Qiita上のユーザを表します。",
                    "properties": {
                        "description": {
                            "description": "自己紹介文",
                            "example": "Hello, world.",
                            "type": [
                                "null",
                                "string"
                            ]
                        },
                        "facebook_id": {
                            "description": "Facebook ID",
                            "example": "yaotti",
                            "type": [
                                "null",
                                "string"
                            ]
                        },
                        "followees_count": {
                            "description": "このユーザがフォローしているユーザの数",
                            "example": 100,
                            "type": "integer"
                        },
                        "followers_count": {
                            "description": "このユーザをフォローしているユーザの数",
                            "example": 200,
                            "type": "integer"
                        },
                        "github_login_name": {
                            "description": "GitHub ID",
                            "example": "yaotti",
                            "type": [
                                "null",
                                "string"
                            ]
                        },
                        "id": {
                            "description": "ユーザID",
                            "example": "yaotti",
                            "type": "string"
                        },
                        "items_count": {
                            "description": "このユーザが qiita.com 上で公開している投稿の数 (Qiita:Teamでの投稿数は含まれません)",
                            "example": 300,
                            "type": "integer"
                        },
                        "linkedin_id": {
                            "description": "LinkedIn ID",
                            "example": "yaotti",
                            "type": [
                                "null",
                                "string"
                            ]
                        },
                        "location": {
                            "description": "居住地",
                            "example": "Tokyo, Japan",
                            "type": [
                                "null",
                                "string"
                            ]
                        },
                        "name": {
                            "description": "設定している名前",
                            "example": "Hiroshige Umino",
                            "type": [
                                "null",
                                "string"
                            ]
                        },
                        "organization": {
                            "description": "所属している組織",
                            "example": "Increments Inc",
                            "type": [
                                "null",
                                "string"
                            ]
                        },
                        "permanent_id": {
                            "description": "ユーザごとに割り当てられる整数のID",
                            "example": 1,
                            "type": "integer"
                        },
                        "profile_image_url": {
                            "description": "設定しているプロフィール画像のURL",
                            "example": "https://si0.twimg.com/profile_images/2309761038/1ijg13pfs0dg84sk2y0h_normal.jpeg",
                            "type": "string"
                        },
                        "twitter_screen_name": {
                            "description": "Twitterのスクリーンネーム",
                            "example": "yaotti",
                            "type": [
                                "null",
                                "string"
                            ]
                        },
                        "website_url": {
                            "description": "設定しているWebサイトのURL",
                            "example": "http://yaotti.hatenablog.com",
                            "type": [
                                "null",
                                "string"
                            ]
                        }
                    },
                    "required": [
                        "description",
                        "facebook_id",
                        "followees_count",
                        "followers_count",
                        "github_login_name",
                        "id",
                        "items_count",
                        "linkedin_id",
                        "location",
                        "name",
                        "organization",
                        "permanent_id",
                        "profile_image_url",
                        "twitter_screen_name",
                        "website_url"
                    ],
                    "title": "ユーザ"
                }
            },
            "required": [
                "rendered_body",
                "body",
                "coediting",
                "created_at",
                "id",
                "private",
                "tags",
                "title",
                "updated_at",
                "url",
                "user"
            ],
            "title": "投稿"
        },
        "project": {
            "description": "Qiita:Team上でのプロジェクトを表します。Qiita:Teamでのみ有効です。",
            "links": [
                {
                    "description": "チーム内に存在するプロジェクト一覧をプロジェクト作成日時の降順で返します。",
                    "href": "/api/v2/projects",
                    "method": "GET",
                    "rel": "instances",
                    "schema": {
                        "properties": {
                            "page": {
                                "description": "ページ番号 (1から100まで)",
                                "example": 1,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            },
                            "per_page": {
                                "description": "1ページあたりに含まれる要素数 (1から100まで)",
                                "example": 20,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            }
                        }
                    },
                    "title": "list_projects"
                },
                {
                    "description": "プロジェクトを新たに作成します。",
                    "href": "/api/v2/projects",
                    "method": "POST",
                    "rel": "create",
                    "schema": {
                        "properties": {
                            "archived": {
                                "description": "このプロジェクトが進行中かどうか",
                                "example": false,
                                "type": "boolean"
                            },
                            "body": {
                                "description": "Markdown形式の本文",
                                "example": "# Example",
                                "type": "string"
                            },
                            "name": {
                                "description": "プロジェクト名",
                                "example": "Kobiro Project",
                                "type": "string"
                            },
                            "tags": {
                                "description": "投稿に付いたタグ一覧",
                                "example": [
                                    {
                                        "name": "Ruby",
                                        "versions": [
                                            "0.0.1"
                                        ]
                                    }
                                ],
                                "items": {
                                    "properties": {
                                        "name": {
                                            "type": "string"
                                        },
                                        "versions": {
                                            "items": {
                                                "type": "string"
                                            },
                                            "type": "array"
                                        }
                                    },
                                    "required": [
                                        "name"
                                    ],
                                    "type": "object"
                                },
                                "type": "array",
                                "uniqueItems": true
                            }
                        },
                        "required": [
                            "body",
                            "name"
                        ]
                    },
                    "title": "create_project"
                },
                {
                    "description": "プロジェクトを削除します。",
                    "href": "/api/v2/projects/:project_id",
                    "mediaType": "null",
                    "method": "DELETE",
                    "rel": "delete",
                    "title": "delete_project"
                },
                {
                    "description": "プロジェクトを返します。",
                    "href": "/api/v2/projects/:project_id",
                    "method": "GET",
                    "rel": "self",
                    "title": "get_project"
                },
                {
                    "description": "プロジェクトを更新します。",
                    "href": "/api/v2/projects/:project_id",
                    "method": "PATCH",
                    "rel": "update",
                    "schema": {
                        "properties": {
                            "archived": {
                                "description": "このプロジェクトが進行中かどうか",
                                "example": false,
                                "type": "boolean"
                            },
                            "body": {
                                "description": "Markdown形式の本文",
                                "example": "# Example",
                                "type": "string"
                            },
                            "name": {
                                "description": "プロジェクト名",
                                "example": "Kobiro Project",
                                "type": "string"
                            },
                            "tags": {
                                "description": "投稿に付いたタグ一覧",
                                "example": [
                                    {
                                        "name": "Ruby",
                                        "versions": [
                                            "0.0.1"
                                        ]
                                    }
                                ],
                                "items": {
                                    "properties": {
                                        "name": {
                                            "type": "string"
                                        },
                                        "versions": {
                                            "items": {
                                                "type": "string"
                                            },
                                            "type": "array"
                                        }
                                    },
                                    "required": [
                                        "name"
                                    ],
                                    "type": "object"
                                },
                                "type": "array",
                                "uniqueItems": true
                            }
                        },
                        "required": [
                            "body",
                            "name"
                        ]
                    },
                    "title": "patch_project"
                }
            ],
            "properties": {
                "archived": {
                    "description": "このプロジェクトが進行中かどうか",
                    "example": false,
                    "type": "boolean"
                },
                "body": {
                    "description": "Markdown形式の本文",
                    "example": "# Example",
                    "type": "string"
                },
                "created_at": {
                    "description": "データが作成された日時",
                    "example": "2000-01-01T00:00:00+00:00",
                    "format": "date-time",
                    "type": "string"
                },
                "id": {
                    "description": "プロジェクトのチーム上での一意なID",
                    "example": 1,
                    "type": "integer"
                },
                "name": {
                    "description": "プロジェクト名",
                    "example": "Kobiro Project",
                    "type": "string"
                },
                "rendered_body": {
                    "description": "HTML形式の本文",
                    "example": "<h1>Example</h1>",
                    "type": "string"
                },
                "updated_at": {
                    "description": "データが最後に更新された日時",
                    "example": "2000-01-01T00:00:00+00:00",
                    "format": "date-time",
                    "type": "string"
                }
            },
            "required": [
                "rendered_body",
                "archived",
                "body",
                "created_at",
                "id",
                "name",
                "updated_at"
            ],
            "title": "プロジェクト"
        },
        "tag": {
            "description": "投稿に付けられた個々のタグを表します。",
            "links": [
                {
                    "description": "タグ一覧を作成日時の降順で返します。",
                    "href": "/api/v2/tags",
                    "method": "GET",
                    "rel": "instances",
                    "schema": {
                        "properties": {
                            "page": {
                                "description": "ページ番号 (1から100まで)",
                                "example": 1,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            },
                            "per_page": {
                                "description": "1ページあたりに含まれる要素数 (1から100まで)",
                                "example": 20,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            }
                        }
                    },
                    "title": "list_tags"
                },
                {
                    "description": "タグを取得します。",
                    "href": "/api/v2/tags/:tag_id",
                    "method": "GET",
                    "rel": "self",
                    "title": "get_tag"
                },
                {
                    "description": "ユーザがフォローしているタグ一覧をフォロー日時の降順で返します。",
                    "href": "/api/v2/users/:user_id/following_tags",
                    "method": "GET",
                    "rel": "instances",
                    "schema": {
                        "properties": {
                            "page": {
                                "description": "ページ番号 (1から100まで)",
                                "example": 1,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            },
                            "per_page": {
                                "description": "1ページあたりに含まれる要素数 (1から100まで)",
                                "example": 20,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            }
                        }
                    },
                    "title": "list_user_following_tags"
                },
                {
                    "description": "タグのフォローを外します。",
                    "href": "/api/v2/tags/:tag_id/following",
                    "mediaType": "null",
                    "method": "DELETE",
                    "rel": "delete",
                    "title": "unfollow_tag"
                },
                {
                    "description": "タグをフォローしているかどうかを調べます。",
                    "href": "/api/v2/tags/:tag_id/following",
                    "method": "GET",
                    "rel": "check",
                    "title": "get_tag_following"
                },
                {
                    "description": "タグをフォローします。",
                    "href": "/api/v2/tags/:tag_id/following",
                    "mediaType": "null",
                    "method": "PUT",
                    "rel": "put",
                    "title": "follow_tag"
                }
            ],
            "properties": {
                "followers_count": {
                    "description": "このタグをフォローしているユーザの数",
                    "example": 100,
                    "type": "integer"
                },
                "icon_url": {
                    "description": "このタグに設定されたアイコン画像のURL",
                    "example": "https://s3-ap-northeast-1.amazonaws.com/qiita-tag-image/9de6a11d330f5694820082438f88ccf4a1b289b2/medium.jpg",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                "id": {
                    "description": "タグを特定するための一意な名前",
                    "example": "qiita",
                    "type": "string"
                },
                "items_count": {
                    "description": "このタグが付けられた投稿の数",
                    "example": 200,
                    "type": "integer"
                }
            },
            "required": [
                "followers_count",
                "icon_url",
                "id",
                "items_count"
            ],
            "title": "タグ"
        },
        "tagging": {
            "description": "投稿とタグとの関連を表します。",
            "links": [
                {
                    "description": "投稿にタグを追加します。Qiita:Teamでのみ有効です。",
                    "href": "/api/v2/items/:item_id/taggings",
                    "method": "POST",
                    "rel": "create",
                    "schema": {
                        "properties": {
                            "name": {
                                "description": "タグを特定するための一意な名前",
                                "example": "qiita",
                                "type": "string"
                            },
                            "versions": {
                                "example": [
                                    "0.0.1"
                                ],
                                "items": {
                                    "type": "string"
                                },
                                "type": "array"
                            }
                        },
                        "required": [
                            "name"
                        ]
                    },
                    "title": "create_tagging"
                },
                {
                    "description": "投稿から指定されたタグを取り除きます。Qiita:Teamでのみ有効です。",
                    "href": "/api/v2/items/:item_id/taggings/:tagging_id",
                    "mediaType": "null",
                    "method": "DELETE",
                    "rel": "delete",
                    "title": "delete_tagging"
                }
            ],
            "properties": {
                "name": {
                    "description": "タグを特定するための一意な名前",
                    "example": "qiita",
                    "type": "string"
                },
                "versions": {
                    "example": [
                        "0.0.1"
                    ],
                    "items": {
                        "type": "string"
                    },
                    "type": "array"
                }
            },
            "required": [
                "name",
                "versions"
            ],
            "title": "タギング"
        },
        "team": {
            "description": "Qiita:Team上で所属しているチームを表します。Qiita:Teamでのみ有効です。",
            "links": [
                {
                    "description": "ユーザが所属している全てのチームを、チーム作成日時の降順で返します。",
                    "href": "/api/v2/teams",
                    "method": "GET",
                    "rel": "instances",
                    "title": "list_teams"
                }
            ],
            "properties": {
                "active": {
                    "description": "チームが利用可能な状態かどうか",
                    "example": true,
                    "type": "boolean"
                },
                "id": {
                    "description": "チームの一意なID",
                    "example": "increments",
                    "type": "string"
                },
                "name": {
                    "description": "チームに設定されている名前を表します。",
                    "example": "Increments Inc.",
                    "type": "string"
                }
            },
            "required": [
                "active",
                "id",
                "name"
            ],
            "title": "チーム"
        },
        "template": {
            "description": "投稿のひな形に利用できるテンプレートを表します。Qiita:Teamでのみ有効です。",
            "links": [
                {
                    "description": "チーム内のテンプレート一覧を返します。",
                    "href": "/api/v2/templates",
                    "method": "GET",
                    "rel": "instances",
                    "schema": {
                        "properties": {
                            "page": {
                                "description": "ページ番号 (1から100まで)",
                                "example": 1,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            },
                            "per_page": {
                                "description": "1ページあたりに含まれる要素数 (1から100まで)",
                                "example": 20,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            }
                        }
                    },
                    "title": "list_templates"
                },
                {
                    "description": "テンプレートを削除します。",
                    "href": "/api/v2/templates/:template_id",
                    "mediaType": "null",
                    "method": "DELETE",
                    "rel": "delete",
                    "title": "delete_template"
                },
                {
                    "description": "テンプレートを取得します。",
                    "href": "/api/v2/templates/:template_id",
                    "method": "GET",
                    "rel": "self",
                    "title": "get_template"
                },
                {
                    "description": "新しくテンプレートを作成します。",
                    "href": "/api/v2/templates",
                    "method": "POST",
                    "rel": "create",
                    "schema": {
                        "properties": {
                            "body": {
                                "description": "テンプレートの本文",
                                "example": "Weekly MTG on %{Year}/%{month}/%{day}",
                                "type": "string"
                            },
                            "name": {
                                "description": "テンプレートを判別するための名前",
                                "example": "Weekly MTG",
                                "type": "string"
                            },
                            "tags": {
                                "description": "タグ一覧",
                                "example": [
                                    {
                                        "name": "MTG/%{Year}/%{month}/%{day}",
                                        "versions": [
                                            "0.0.1"
                                        ]
                                    }
                                ],
                                "items": {
                                    "properties": {
                                        "name": {
                                            "type": "string"
                                        },
                                        "versions": {
                                            "items": {
                                                "type": "string"
                                            },
                                            "type": "array"
                                        }
                                    },
                                    "required": [
                                        "name"
                                    ]
                                },
                                "type": "array",
                                "uniqueItems": true
                            },
                            "title": {
                                "description": "生成される投稿のタイトルの雛形",
                                "example": "Weekly MTG on %{Year}/%{month}/%{day}",
                                "type": "string"
                            }
                        },
                        "required": [
                            "body",
                            "name",
                            "tags",
                            "title"
                        ]
                    },
                    "title": "create_template"
                },
                {
                    "description": "テンプレートを更新します。",
                    "href": "/api/v2/templates/:template_id",
                    "method": "PATCH",
                    "rel": "update",
                    "schema": {
                        "properties": {
                            "body": {
                                "description": "テンプレートの本文",
                                "example": "Weekly MTG on %{Year}/%{month}/%{day}",
                                "type": "string"
                            },
                            "name": {
                                "description": "テンプレートを判別するための名前",
                                "example": "Weekly MTG",
                                "type": "string"
                            },
                            "tags": {
                                "description": "タグ一覧",
                                "example": [
                                    {
                                        "name": "MTG/%{Year}/%{month}/%{day}",
                                        "versions": [
                                            "0.0.1"
                                        ]
                                    }
                                ],
                                "items": {
                                    "properties": {
                                        "name": {
                                            "type": "string"
                                        },
                                        "versions": {
                                            "items": {
                                                "type": "string"
                                            },
                                            "type": "array"
                                        }
                                    },
                                    "required": [
                                        "name"
                                    ]
                                },
                                "type": "array",
                                "uniqueItems": true
                            },
                            "title": {
                                "description": "生成される投稿のタイトルの雛形",
                                "example": "Weekly MTG on %{Year}/%{month}/%{day}",
                                "type": "string"
                            }
                        },
                        "required": [
                            "body",
                            "name",
                            "tags",
                            "title"
                        ]
                    },
                    "title": "update_template"
                }
            ],
            "properties": {
                "body": {
                    "description": "テンプレートの本文",
                    "example": "Weekly MTG on %{Year}/%{month}/%{day}",
                    "type": "string"
                },
                "expanded_body": {
                    "description": "変数を展開した状態の本文",
                    "example": "Weekly MTG on 2000/01/01",
                    "type": "string"
                },
                "expanded_tags": {
                    "description": "変数を展開した状態のタグ一覧",
                    "example": [
                        {
                            "name": "MTG/2000/01/01",
                            "versions": [
                                "0.0.1"
                            ]
                        }
                    ],
                    "items": {
                        "properties": {
                            "name": {
                                "type": "string"
                            },
                            "versions": {
                                "items": {
                                    "type": "string"
                                },
                                "type": "array"
                            }
                        },
                        "required": [
                            "name"
                        ]
                    },
                    "type": "array",
                    "uniqueItems": true
                },
                "expanded_title": {
                    "description": "変数を展開した状態のタイトル",
                    "example": "Weekly MTG on 2015/06/03",
                    "type": "string"
                },
                "id": {
                    "description": "テンプレートの一意なID",
                    "example": 1,
                    "type": "integer"
                },
                "name": {
                    "description": "テンプレートを判別するための名前",
                    "example": "Weekly MTG",
                    "type": "string"
                },
                "tags": {
                    "description": "タグ一覧",
                    "example": [
                        {
                            "name": "MTG/%{Year}/%{month}/%{day}",
                            "versions": [
                                "0.0.1"
                            ]
                        }
                    ],
                    "items": {
                        "properties": {
                            "name": {
                                "type": "string"
                            },
                            "versions": {
                                "items": {
                                    "type": "string"
                                },
                                "type": "array"
                            }
                        },
                        "required": [
                            "name"
                        ]
                    },
                    "type": "array",
                    "uniqueItems": true
                },
                "title": {
                    "description": "生成される投稿のタイトルの雛形",
                    "example": "Weekly MTG on %{Year}/%{month}/%{day}",
                    "type": "string"
                }
            },
            "required": [
                "body",
                "id",
                "name",
                "expanded_body",
                "expanded_tags",
                "expanded_title",
                "tags",
                "title"
            ],
            "title": "テンプレート"
        },
        "user": {
            "description": "Qiita上のユーザを表します。",
            "links": [
                {
                    "description": "投稿をストックしているユーザ一覧を、ストックした日時の降順で返します。",
                    "href": "/api/v2/items/:item_id/stockers",
                    "method": "GET",
                    "rel": "instances",
                    "schema": {
                        "properties": {
                            "page": {
                                "description": "ページ番号 (1から100まで)",
                                "example": 1,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            },
                            "per_page": {
                                "description": "1ページあたりに含まれる要素数 (1から100まで)",
                                "example": 20,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            }
                        }
                    },
                    "title": "list_item_stockers"
                },
                {
                    "description": "全てのユーザの一覧を作成日時の降順で取得します。",
                    "href": "/api/v2/users",
                    "method": "GET",
                    "rel": "instances",
                    "schema": {
                        "properties": {
                            "page": {
                                "description": "ページ番号 (1から100まで)",
                                "example": 1,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            },
                            "per_page": {
                                "description": "1ページあたりに含まれる要素数 (1から100まで)",
                                "example": 20,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            }
                        }
                    },
                    "title": "list_users"
                },
                {
                    "description": "ユーザを取得します。",
                    "href": "/api/v2/users/:user_id",
                    "method": "GET",
                    "rel": "self",
                    "title": "get_user"
                },
                {
                    "description": "ユーザがフォローしているユーザ一覧を取得します。",
                    "href": "/api/v2/users/:user_id/followees",
                    "method": "GET",
                    "rel": "instances",
                    "schema": {
                        "properties": {
                            "page": {
                                "description": "ページ番号 (1から100まで)",
                                "example": 1,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            },
                            "per_page": {
                                "description": "1ページあたりに含まれる要素数 (1から100まで)",
                                "example": 20,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            }
                        }
                    },
                    "title": "list_user_followees"
                },
                {
                    "description": "ユーザをフォローしているユーザ一覧を取得します。",
                    "href": "/api/v2/users/:user_id/followers",
                    "method": "GET",
                    "rel": "instances",
                    "schema": {
                        "properties": {
                            "page": {
                                "description": "ページ番号 (1から100まで)",
                                "example": 1,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            },
                            "per_page": {
                                "description": "1ページあたりに含まれる要素数 (1から100まで)",
                                "example": 20,
                                "pattern": "^[0-9]+$",
                                "type": "string"
                            }
                        }
                    },
                    "title": "list_user_followers"
                },
                {
                    "description": "ユーザへのフォローを外します。",
                    "href": "/api/v2/users/:user_id/following",
                    "mediaType": "null",
                    "method": "DELETE",
                    "rel": "delete",
                    "title": "unfollow_user"
                },
                {
                    "description": "ユーザをフォローしている場合に204を返します。",
                    "href": "/api/v2/users/:user_id/following",
                    "method": "GET",
                    "rel": "check",
                    "title": "get_user_following"
                },
                {
                    "description": "ユーザをフォローします。",
                    "href": "/api/v2/users/:user_id/following",
                    "mediaType": "null",
                    "method": "PUT",
                    "rel": "put",
                    "title": "follow_user"
                }
            ],
            "properties": {
                "description": {
                    "description": "自己紹介文",
                    "example": "Hello, world.",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                "facebook_id": {
                    "description": "Facebook ID",
                    "example": "yaotti",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                "followees_count": {
                    "description": "このユーザがフォローしているユーザの数",
                    "example": 100,
                    "type": "integer"
                },
                "followers_count": {
                    "description": "このユーザをフォローしているユーザの数",
                    "example": 200,
                    "type": "integer"
                },
                "github_login_name": {
                    "description": "GitHub ID",
                    "example": "yaotti",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                "id": {
                    "description": "ユーザID",
                    "example": "yaotti",
                    "type": "string"
                },
                "items_count": {
                    "description": "このユーザが qiita.com 上で公開している投稿の数 (Qiita:Teamでの投稿数は含まれません)",
                    "example": 300,
                    "type": "integer"
                },
                "linkedin_id": {
                    "description": "LinkedIn ID",
                    "example": "yaotti",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                "location": {
                    "description": "居住地",
                    "example": "Tokyo, Japan",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                "name": {
                    "description": "設定している名前",
                    "example": "Hiroshige Umino",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                "organization": {
                    "description": "所属している組織",
                    "example": "Increments Inc",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                "permanent_id": {
                    "description": "ユーザごとに割り当てられる整数のID",
                    "example": 1,
                    "type": "integer"
                },
                "profile_image_url": {
                    "description": "設定しているプロフィール画像のURL",
                    "example": "https://si0.twimg.com/profile_images/2309761038/1ijg13pfs0dg84sk2y0h_normal.jpeg",
                    "type": "string"
                },
                "twitter_screen_name": {
                    "description": "Twitterのスクリーンネーム",
                    "example": "yaotti",
                    "type": [
                        "null",
                        "string"
                    ]
                },
                "website_url": {
                    "description": "設定しているWebサイトのURL",
                    "example": "http://yaotti.hatenablog.com",
                    "type": [
                        "null",
                        "string"
                    ]
                }
            },
            "required": [
                "description",
                "facebook_id",
                "followees_count",
                "followers_count",
                "github_login_name",
                "id",
                "items_count",
                "linkedin_id",
                "location",
                "name",
                "organization",
                "permanent_id",
                "profile_image_url",
                "twitter_screen_name",
                "website_url"
            ],
            "title": "ユーザ"
        }
    },
    "required": [
        "access_token",
        "authenticated_user",
        "comment",
        "expanded_template",
        "item",
        "project",
        "tag",
        "tagging",
        "team",
        "template",
        "user"
    ],
    "title": "Qiita API v2 JSON Schema"
}
