require 'cancan'
module Iuris
	module Meetings
		class AbilityDecorator
			include CanCan::Ability

			def initialize(user)
				unless user.admin?
					can :manage, Iuris::Meetings::Meeting, user_id: user.id
				end
			end
		end
	end
end

Iuris::Ability.register_ability(Iuris::Meetings::AbilityDecorator)