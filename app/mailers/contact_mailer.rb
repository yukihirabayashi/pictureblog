class ContactMailer < ApplicationMailer
      def contact_mail(picture)

        @picture = picture
        mail to: picture.user.email, subject:"ブログ投稿完了メール"
        
    end
end
