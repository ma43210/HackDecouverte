
extends Node

# All available quests are stored here.
var quests: Array[Dictionary] = []


# Called when the game starts.
func _ready() -> void:
	create_daily_quests()


# Create the daily quests.
func create_daily_quests() -> void:

	quests = [
		{
			"id": "walking",
			"name": "Take a Walk",
			"description": "Walk for 20 minutes.",
			"target": 20,
			"progress": 0,
			"reward": 30,
			"completed": false
		},

		{
			"id": "hydration",
			"name": "Stay Hydrated",
			"description": "Drink 4 glasses of water.",
			"target": 4,
			"progress": 0,
			"reward": 20,
			"completed": false
		},

		{
			"id": "healthy_meal",
			"name": "Healthy Eating",
			"description": "Log a balanced meal.",
			"target": 1,
			"progress": 0,
			"reward": 15,
			"completed": false
		},

		{
			"id": "workout",
			"name": "Get Moving",
			"description": "Complete a workout.",
			"target": 1,
			"progress": 0,
			"reward": 25,
			"completed": false
		}
	]


# Update the progress of a specific quest.
func update_quest(quest_id: String, amount: int = 1) -> void:

	if amount <= 0:
		return

	for quest in quests:

		if quest["id"] == quest_id:

			# Don't update an already completed quest.
			if quest["completed"]:
				return

			# Add progress.
			quest["progress"] += amount

			# Don't allow progress to exceed the target.
			quest["progress"] = min(
				quest["progress"],
				quest["target"]
			)

			# Check if the quest is finished.
			check_quest_completion(quest)

			return


# Check whether a quest has been completed.
func check_quest_completion(quest: Dictionary) -> void:

	if quest["progress"] >= quest["target"]:

		quest["completed"] = true

		# Give the player XP.
		XPManager.add_xp(quest["reward"])

		print("Quest completed: ", quest["name"])
		print("XP earned: ", quest["reward"])


# Return all quests.
func get_quests() -> Array[Dictionary]:

	return quests


# Return the progress of a particular quest.
func get_quest_progress(quest_id: String) -> int:

	for quest in quests:

		if quest["id"] == quest_id:
			return quest["progress"]

	return 0


# Check whether a quest has been completed.
func is_quest_completed(quest_id: String) -> bool:

	for quest in quests:

		if quest["id"] == quest_id:
			return quest["completed"]

	return false
