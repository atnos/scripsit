module Scripsit
  class DefaultMailer < ApplicationMailer
    def prepare_email(to, slug, options = {})
      return if to.blank?
      content_email = Content.joins(:scripsit_slug)
                             .where(scripsit_slugs: { slug: slug })
                             .where(active: true).first
      return unless content_email
      @subject = content_email.subject
      @body = content_email.body

      # Processing attachments
      parse_attachments(options)

      # Processing through Liquid gem
      parse_liquid(options)

      # Formating email
      @body_html = simple_format(@body, {}, sanitize: false)
      @body_text = strip_tags(@body)

      history(to, content_email, options)
      sendmail(to, options)
    end

    protected

    def parse_liquid(options)
      return unless options[:data]
      t = ::Liquid::Template.parse(@subject)
      @subject = t.render(options[:data]).html_safe
      t = ::Liquid::Template.parse(@body)
      @body = t.render(options[:data]).html_safe
    end

    def parse_attachments(options)
      return unless options[:attachments].presence
      options[:attachments].each do |name, attachment|
        attachments[name] = attachment
      end
    end

    def history(to, content_email, options)
      History.create(name: content_email.scripsit_slug.name,
                     slug: content_email.scripsit_slug.slug,
                     to: to, subject: @subject, body: @body,
                     cc: options[:cc], bcc: options[:bcc],
                     data: options[:data])
    end

    def sendmail(to, options)
      mail_params = {
        to: to,
        subject: (options[:subject_prefix] || "") + @subject,
        cc: options[:cc],
        bcc: options[:bcc],
        'reply-to': options[:'reply-to'],
        template_name: options[:template_name] ? options[:template_name] : "default_email"
      }
      mail_params[:from] = options[:from] if options[:from].present?
      mail mail_params
    end
  end
end
