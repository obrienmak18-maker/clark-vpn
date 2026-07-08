const mongoose = require("mongoose");

const ServerSchema = mongoose.Schema(
  {
    name: {
      type: String,
      required: true,
    },
    location: {
      type: String,
      required: true,
    },
    ipAddress: {
      type: String,
      required: true,
      unique: true,
    },
    config: {
      type: String, // WireGuard/OpenVPN config string
      required: true,
    },
    status: {
      type: String,
      enum: ["active", "inactive", "maintenance"],
      default: "active",
    },
    ping: {
      type: Number,
      default: 0,
    },
    load: {
      type: Number,
      default: 0,
    },
  },
  { timestamps: true }
);

module.exports = mongoose.model("Server", ServerSchema);
