#!/bin/bash
# Ralph harness for Cursor — run in target project root
# Usage: ./scripts/ralph.sh | Stop: touch .ralph-stop

set -e
PLAN="specs/implementation-plans/active-plan.md"
LOG_DIR=".ralph-logs"
MAX_ITERATIONS="${RALPH_MAX_ITERATIONS:-100}"
mkdir -p "$LOG_DIR"

[ -f ".ralph-security" ] || { echo "Run /prd-build-loop first"; exit 1; }
[ -f "$PLAN" ] || { echo "No active-plan.md"; exit 1; }

REMAINING=$(grep -c "^\- \[ \]" "$PLAN" 2>/dev/null || echo "0")
[ "$REMAINING" -eq 0 ] && { echo "✅ All complete"; exit 0; }

echo "Tasks remaining: $REMAINING"
echo "Each iteration: new Cursor chat → /prd-build-loop continue"
echo "Stop: touch .ralph-stop"
echo ""

ITERATION=0
while [ "$ITERATION" -lt "$MAX_ITERATIONS" ]; do
  [ -f ".ralph-stop" ] && { rm -f .ralph-stop; echo "🛑 Stopped"; break; }
  REMAINING=$(grep -c "^\- \[ \]" "$PLAN" 2>/dev/null || echo "0")
  [ "$REMAINING" -eq 0 ] && { echo "🎉 Done"; break; }
  echo "── Iter $ITERATION: $(grep -m1 '^\- \[ \]' "$PLAN")"
  echo "Complete task in Cursor, then press Enter..."
  read -r _
  ITERATION=$((ITERATION + 1))
done
