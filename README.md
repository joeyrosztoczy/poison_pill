# PoisonPill

An antipattern of OTP processes that try to do work on startup that can result in an uncaught exception, bringing an entire supervision tree to its knees.

This is something that exceeds a supervisors :max_restarts and :max_seconds parameters, causing a cascading crash.

