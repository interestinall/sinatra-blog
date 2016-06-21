u1 = User.create(username: "j", email: "j@j.com", password: "pw")
u2 = User.create(username: "l", email: "l@l.com", password: "pw")
u2 = User.create(username: "g", email: "g@g.com", password: "pw")

text = "At, dark, filter sit ristretto latte carajillo french press spoon. Chicory, saucer whipped steamed variety single shot variety. Cortado espresso pumpkin spice dark brewed cream mocha. Americano turkish crema to go est dripper instant spoon crema extra.

Caramelization grinder a shop foam coffee aged café au lait sweet cultivar caramelization. Saucer, est, so instant qui aroma trifecta barista grinder saucer extraction. Grounds galão siphon milk beans café au lait mug id doppio caffeine. Fair trade, bar blue mountain caramelization, aromatic, variety at grounds eu foam saucer extraction.

Cortado that, crema seasonal crema carajillo filter. Ut, turkish kopi-luwak mocha blue mountain espresso extraction. Redeye so half and half, wings, saucer robust, breve spoon a coffee viennese decaffeinated. Acerbic aged coffee breve trifecta, crema a americano in filter cortado.

Sit est skinny robusta, chicory, java café au lait affogato mazagran variety aromatic. Cup saucer sugar strong trifecta black ut white café au lait grinder froth. Mocha skinny espresso, medium decaffeinated dripper doppio aromatic breve doppio. Ut and, froth variety single shot skinny mocha mazagran."


Post.create(title: "my first post" , content: text , user_id: 1)
Post.create(title: "Another Important Thought", content: text , user_id: 1)
Post.create(title: "10 reasons why you should click this bait", content: text, user_id: 1)
Post.create(title: "your fav celeb is in this bad picture", content: text , user_id: 1)


Post.create(title: "my first post" , content: text , user_id: 2)
Post.create(title: "Another Important Thought", content: text , user_id: 2)
Post.create(title: "10 reasons why you should click this bait", content: text, user_id: 2)
Post.create(title: "your fav celeb is in this bad picture", content: text , user_id: 2)

Post.create(title: "my first post" , content: text , user_id: 3)
Post.create(title: "Another Important Thought", content: text , user_id: 3)
Post.create(title: "10 reasons why you should click this bait", content: text, user_id: 1)
Post.create(title: "your fav celeb is in this bad picture", content: text , user_id: 3)