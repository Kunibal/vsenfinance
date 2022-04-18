# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.destroy_all
Admin.create!(
    email: 'admin@vsen.com',
    password: '123456',
    password_confirmation: '123456'
    )

Customer.destroy_all
    # 会員一覧
Customer.create!(
    id: 1,
    email: 'tanaka@example.com',
    last_name: '田中',
    first_name: '店長',
    last_name_kana: 'タナカ',
    first_name_kana: 'テンチョウ',
    postal_code: '9900034',
    prefecture_code: 6,
    city: '山形市東原町',
    block: '二丁目',
    building_name: 'ボロボロビル',
    password: 'password',
    password_confirmation: 'password'
    )

Customer.create!(
    id: 2,
    email: 'yamada@yafoo.com',
    last_name: '山田',
    first_name: '店長',
    last_name_kana: 'ヤマダ',
    first_name_kana: 'テンチョウ',
    postal_code: '9800004',
    prefecture_code: 4,
    city: '仙台市青葉区宮町',
    block: '二丁目',
    building_name: 'ピカピカビル',
    password: 'password',
    password_confirmation: 'password'
    )

Customer.create!(
    id: 3,
    email: 'yamamoto@qmail.com',
    last_name: '山本',
    first_name: '店長',
    last_name_kana: 'ヤマモト',
    first_name_kana: 'テンチョウ',
    postal_code: '0300111',
    prefecture_code: 2,
    city: '青森市荒川',
    block: '二丁目',
    building_name: 'カラカラビル',
    password: 'password',
    password_confirmation: 'password'
    )

Customer.create!(
    id: 4,
    email: 'yamaguchi@zwitter.com',
    last_name: '山口',
    first_name: '店長',
    last_name_kana: 'ヤマグチ',
    first_name_kana: 'テンチョウ',
    postal_code: '0300111',
    prefecture_code: 2,
    city: '青森市荒川',
    block: '二丁目',
    building_name: 'カラカラビル',
    password: 'password',
    password_confirmation: 'password'
    )

Customer.create!(
    id: 5,
    email: 'yamagata@headbook.com',
    last_name: '山形',
    first_name: '店長',
    last_name_kana: 'ヤマガタ',
    first_name_kana: 'テンチョウ',
    postal_code: '0300111',
    prefecture_code: 2,
    city: '青森市荒川',
    block: '二丁目',
    building_name: 'カラカラビル',
    password: 'password',
    password_confirmation: 'password'
    )

    # 商品一覧
Item.destroy_all
cake1 = Item.new(
    name: 'チーズケーキ',
    description: '令和２年に長野県でのチーズケーキコンテストで一位をとったチーズケーキでございます。',
    price: 2500,
  )
  cake1.image.attach(io: File.open(File.join(Rails.root, '/app/assets/images/cheese_cake.jpg')), filename: "cheese_cake.jpg")
  cake1.save

cake2 = Item.new(
    name: 'キラキラカップケーキ',
    description: 'とてもふわふわで、お子様に人気一番のカップケーキでございます。',
    price: 1100,
  )
  cake2.image.attach(io: File.open(File.join(Rails.root, '/app/assets/images/cupcake.jpg')), filename: "cupcake.jpg")
  cake2.save

cake3 = Item.new(
    name: 'タルトショコラ',
    description: 'チョコが好きなお方にはオススメです。',
    price: 1800,
  )
  cake3.image.attach(io: File.open(File.join(Rails.root, '/app/assets/images/chocotart.jpg')), filename: "chocotart.jpg")
  cake3.save

cake4 = Item.new(
    name: 'タピオカプリン',
    description: 'タピオカプリンは珍しいですが、ぜひお試しください。',
    price: 2200,
  )
  cake4.image.attach(io: File.open(File.join(Rails.root, '/app/assets/images/pudding.jpg')), filename: "pudding.jpg")
  cake4.save

cake5 = Item.new(
    name: '苺大福',
    description: '季節のいちごを使用して、お子様からお年寄りまで、誰でも大好きな苺大福でございます。',
    price: 2900,
  )
  cake5.image.attach(io: File.open(File.join(Rails.root, '/app/assets/images/ichigo.jpg')), filename: "ichigo.jpg")
  cake5.save

Cart.destroy_all


    # お知らせ一覧
Post.destroy_all
Post.create!(
    title: 'グランドオープニング',
    body: '本日より開店いたします。是非、足をお運び頂ければ幸いです。',
    created_at: "2022-02-01 09:08:04.717419000 +0000",
    )

Post.create!(
    title: '臨時休業のおしらせ',
    body: '都合により、○月○日はお休みいたします。',
    created_at: "2022-02-04 09:08:04.717419000 +0000",
    )

Post.create!(
    title: '新商品のお知らせ',
    body: '新商品「クラウンケーキ」をぜひご賞味ください。',
    created_at: "2022-02-15 09:08:04.717419000 +0000",
    )

Post.create!(
    title: '短縮営業のお知らせ',
    body: '○月○日〜○月○日まで、営業時間を●時〜●時といたします。ご了承ください。',
    created_at: "2022-02-24 09:08:04.717419000 +0000",
    )

Post.create!(
    title: '新商品のお知らせ',
    body: '新商品「プリンスケーキ」をぜひご賞味ください。',
    created_at: "2022-03-04 09:08:04.717419000 +0000",
    )

Post.create!(
    title: '臨時休業のお知らせ',
    body: '都合により、○月○日はお休みいたします。',
    created_at: "2022-03-14 09:08:04.717419000 +0000",
    )

Post.create!(
    title: '新商品のお知らせ',
    body: '新商品「プリンスぷりん」をぜひご賞味ください。',
    created_at: "2022-03-23 09:08:04.717419000 +0000",
    )

Revenue.destroy_all
# 店内用の売上情報
320.times do |index|
    Revenue.create!(
        amount: rand(15000..35000),
        head_count: rand(10..40),
        created_at: rand(Date.today.beginning_of_year..Date.today.end_of_year)
        )
end

Order.destroy_all
320.times do |index|
    Order.create!(
        customer_id: rand(1..5),
        order_price: rand(1500..6500),
        customer_name: "田中店長",
        customer_address: "9900034山形県山形市東原町二丁目",
        payment_method: 0,
        created_at: rand(Date.today.beginning_of_year..Date.today.end_of_year)
        )
end