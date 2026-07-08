const express = require("express");
const router = express.Router();
const { getUsers, getUser, updateUser, deleteUser, addVpnProfile, updateVpnProfile, deleteVpnProfile } = require("../controllers/userController");
const { protect } = require("../middleware/authMiddleware");

router.route("/").get(protect, getUsers);
router.route("/:id").get(protect, getUser).put(protect, updateUser).delete(protect, deleteUser);
router.route("/:id/vpn-profiles").post(protect, addVpnProfile);
router.route("/:id/vpn-profiles/:profileId").put(protect, updateVpnProfile).delete(protect, deleteVpnProfile);

module.exports = router;
