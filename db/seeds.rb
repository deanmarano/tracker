# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

dean = User.find_or_create_by_display_name(first_name: 'Dean', last_name: 'Marano', display_name: 'Dean')
finished_state = State.find_or_create_by_name(name: 'finished')
finish_action = Action.find_or_create_by_name(name: 'finish', resulting_state: finished_state)
started_state = State.find_or_create_by_name(name: 'started', next_action_ids: [finish_action.id])
start_action = Action.find_or_create_by_name(name: 'start', resulting_state: started_state)
unstarted_state = State.find_or_create_by_name(name: 'unstarted', next_action_ids: [start_action.id])
chore = Template.find_or_create_by_name(name: 'chore', icon: 'cog')
feature = Template.find_or_create_by_name(name: 'feature', icon: 'star')
Task.find_or_create_by_title(state: unstarted_state, template: chore, title: 'Find a name', notes: 'It should be marketable.', author: dean)
starting_task = Task.find_or_create_by_title(state: unstarted_state, template: feature, title: 'Allow moving to the started state', notes: 'I should be able to click a button to start', author: dean)
Task.find_or_create_by_title(state: unstarted_state, template: feature, title: 'create method to find next state', notes: 'template.next_states should return next possible states', author: dean, :super_task => starting_task)
Task.find_or_create_by_title(state: unstarted_state, template: feature, title: 'Allow moving to the finished state', notes: 'I should be able to click a button to finish', author: dean)
