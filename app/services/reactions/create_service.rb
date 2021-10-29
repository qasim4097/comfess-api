module Reactions
  class CreateService
    extend ActiveModel::Naming

    attr_reader :reactable, :params, :object, :errors

    def initialize(params)
      @params = params
      @errors = ActiveModel::Errors.new(self)
    end

    def save
      register && valid?
    end

    def valid?
      !self.errors.present?
    end

    private
      def register
        reaction = klass.new(user_id: params[:user_id], reactable: reactable)

        self.errors.add(:base, reaction.errors.full_messages) unless reaction.save

        @object = reaction
      end

      def klass
        params[:type].classify.constantize
      end

      def reactable
        @reactable ||= begin
          object_key = params.keys.find { |x| x.match(/id/) }
          model = object_key.split('_').first.classify.constantize
          model.find params[object_key]
        end
      end
  end
end
