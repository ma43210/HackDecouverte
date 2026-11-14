
extends Node

signal quests_changed

# All available quests.
var quests: Array[Dictionary] = []

# Where quest data is stored.
const SAVE_PATH = "user://quests.json"

# The date these quests were created.
var quest_date: String = ""


# Called when the game starts.
func _ready() -> void:

	if not load_quest_data():
		create_daily_quests()
		quest_date = Time.get_date_string_from_system()
		save_quest_data()

	check_daily_reset()


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

	quests_changed.emit()


# Update the progress of a specific quest.
func update_quest(quest_id: String, amount: int = 1) -> void:

	if amount <= 0:
		return

	for quest in quests:

		if quest["id"] == quest_id:

			if quest["completed"]:
				return

			quest["progress"] += amount

			quest["progress"] = min(
				quest["progress"],
				quest["target"]
			)

			check_quest_completion(quest)

			# Save the updated progress.
			save_quest_data()

			# Tell the UI to refresh.
			quests_changed.emit()

			return


# Check whether a quest has been completed.
func check_quest_completion(quest: Dictionary) -> void:

	if quest["progress"] >= quest["target"]:

		quest["completed"] = true

		xp_manager.add_xp(quest["reward"])

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


# Save quest progress to a JSON file.
func save_quest_data() -> void:

	var save_data = {
		"date": quest_date,
		"quests": quests
	}

	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)

	if file == null:
		print("Error saving quests: ", FileAccess.get_open_error())
		return

	file.store_string(JSON.stringify(save_data))
	file.close()

	print("Quest progress saved.")


# Load quest progress from a JSON file.
func load_quest_data() -> bool:

	if not FileAccess.file_exists(SAVE_PATH):
		return false

	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)

	if file == null:
		print("Error loading quests.")
		return false

	var json_text = file.get_as_text()
	file.close()

	var loaded_data = JSON.parse_string(json_text)

	if not loaded_data is Dictionary:
		print("Invalid quest save file.")
		return false

	if not loaded_data.has("quests") or not loaded_data.has("date"):
		return false

	quests.clear()

	for quest in loaded_data["quests"]:
		if quest is Dictionary:
			quests.append(quest)

	quest_date = str(loaded_data["date"])

	if quests.is_empty():
		return false

	print("Quest progress loaded.")

	return true


# Check whether a new day has started.
func check_daily_reset() -> void:

	var today = Time.get_date_string_from_system()

	if quest_date != today:

		print("New day detected! Resetting quests.")

		create_daily_quests()

		quest_date = today

		save_quest_data()

		print("Daily quests reset.")
