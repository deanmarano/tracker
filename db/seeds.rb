# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

dean = User.find_or_create_by_display_name(first_name: 'Dean', last_name: 'Marano', display_name: 'Dean')

# Feature states and actions
feature_start_action = Action.find_or_create_by_name(name: 'start')
feature_deliver_action = Action.find_or_create_by_name(name: 'deliver')
feature_accept_action = Action.find_or_create_by_name(name: 'accept')
feature_reject_action = Action.find_or_create_by_name(name: 'reject')

feature_unstarted_state = State.find_or_create_by_name(name: 'unstarted', next_action_ids: [feature_start_action.id])
feature_started_state = State.find_or_create_by_name(name: 'started', next_action_ids: [feature_deliver_action.id])
feature_delivered_state = State.find_or_create_by_name(name: 'delivered', next_action_ids: [feature_accept_action.id, feature_reject_action.id])
feature_rejected_state = State.find_or_create_by_name(name: 'rejected', next_action_ids: [feature_start_action.id])
feature_finished_state = State.find_or_create_by_name(name: 'finished')

feature_start_action.update(resulting_state: feature_started_state)
feature_deliver_action.update(resulting_state: feature_delivered_state)
feature_accept_action.update(resulting_state: feature_finished_state)
feature_reject_action.update(resulting_state: feature_rejected_state)

# Chore states and actions
chore_start_action = Action.find_or_create_by_name(name: 'start')
chore_finish_action = Action.find_or_create_by_name(name: 'finish')

chore_unstarted_state = State.find_or_create_by_name(name: 'unstarted', next_action_ids: [chore_start_action.id])
chore_started_state = State.find_or_create_by_name(name: 'started', next_action_ids: [chore_finish_action.id])
chore_finished_state = State.find_or_create_by_name(name: 'finished')

chore_start_action.update(resulting_state: chore_started_state)
chore_finish_action.update(resulting_state: chore_finished_state)


chore = Template.find_or_create_by_name(name: 'chore', icon: 'cog', :initial_state => chore_unstarted_state)
feature = Template.find_or_create_by_name(name: 'feature', icon: 'star', :initial_state => feature_unstarted_state, :options => {:acceptance_criteira => true})

root_task = Task.find_or_create_by_title(template: chore, title: 'Root Task', author: dean)

Task.find_or_create_by_title(template: chore, title: 'Find a name', notes: 'It should be marketable.', author: dean, :super_task => root_task)
starting_task = Task.find_or_create_by_title(template: feature, title: 'Allow moving to the started state', notes: 'I should be able to click a button to start', author: dean, :super_task => root_task)
Task.find_or_create_by_title(template: feature, title: 'create method to find next state', notes: 'template.next_states should return next possible states', author: dean, :super_task => starting_task)
Task.find_or_create_by_title(template: feature, title: 'Allow moving to the finished state', notes: 'I should be able to click a button to finish', author: dean, :super_task => root_task)
