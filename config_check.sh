# This script checks whether the essential environment variables are set

echo "Checking config..."

: ${CONTEXT?"CONTEXT variable is not set"}
: ${ID?"ID variable is not set"}
: ${URL?"URL variable is not set"}
: ${COMPONENTS?"COMPONENTS variable is not set"}

echo "All environment variables set"
exit 0
