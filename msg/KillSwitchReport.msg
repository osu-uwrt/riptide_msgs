# ========================================
# Constants
# ========================================

# The number of kill switches defined below
uint8 NUM_KILL_SWITCHES=4

# ========================================
# Kill Switch IDs
# ========================================

# Note: Do not publish as physical kill switch
uint8 KILL_SWITCH_PHYSICAL=0

# RQT Kill switch is for use in the controllers rqt plugin
uint8 KILL_SWITCH_RQT_CONTROLLER=1

# The kill switch from the physical topside kill switch button
uint8 KILL_SWITCH_TOPSIDE_BUTTON=2

# Debug kill switch should be used when publishing from command line or rqt manual publishing
# It is not recommended, but to avoid confusion this is implemented to allow manual publishing without conflicting
uint8 KILL_SWITCH_DEBUG=3

# ========================================
# Message Definition
# ========================================

# Note: The header must be filled out properly!
# If the time is not present, then the message will be rejected
# The frame id should uniquely identify the code running. This prevents from accidental re-enabling
# on kill from another node publishing as the same switch ID 
std_msgs/Header header

# A switch ID defined above
uint8 kill_switch_id

# If the switch is in a kill state, stopping all active operations
bool switch_asserting_kill

# If the switch needs to periodically update in order to keep out of kill state
bool switch_needs_update
