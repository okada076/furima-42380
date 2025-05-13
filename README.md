# README

＃テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
|nickname            | string | null: false |
|email               | string | null: false,unique: true |
|encrypted_password  | string | null: false |
|last_name           | string | null: false |
|first_name          | string | null: false |
|last_name_kana      | string | null: false |
|first_name_kana     | string | null: false |
|birth_date          | date   | null: false |

### Association
- has_many :items
- has_many :orders



## items テーブル
| Column                | Type        | Options       |  説明 
| ------------------    | ------      | -----------   |-----------
|name                   | string      | null: false   |  商品名
|description            | text        | null: false   |  商品の説明
|price                  | integer     | null: false   |  価格
|category_id            | integer     | null: false   |  カテゴリー
|condition_id           | integer     | null: false   |  商品の状態
|shipping_fee_id        | integer     | null: false   |  配送料の負担
|prefecture_id          | integer     | null: false   |  配送元の地域
|scheduled_delivery_id  | integer     | null: false   |  配送までの日数
|user                   | references  | null: false,foreign_key: true| 出品者

### Association
- belongs_to :user
- has_one :order



## orders テーブル
| Column         | Type       | Options     |
| ---------------| ------     | ----------- |
|user            | references | null: false,foreign_key: true |
|item            | references | null: false,foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル
| Column           | Type       | Options     |
| -----------------| ------     | ----------- |
|postal_code       | string     | null: false |
|prefecture_id     | integer    | null: false |
|city              | string     | null: false |
|address           | string     | null: false |
|building_name     | string     |             |
|phone_number      | string     | null: false |
|order             | references | null: false,foreign_key: true |


### Association
- belongs_to :order