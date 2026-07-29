# Generic config-hygiene policy: ConfigMap values must not carry plaintext
# credentials (a connection string with password=/token=/secret= in it). Rego,
# applied by the conftest CLI via scripts/lint-conftest.sh.
#
# Deliberately orthogonal to the kyverno policies next door (image tags,
# Application namespaces) so a finding here can only come from conftest.
#
# The package name is what conftest reports as each result's "namespace", and
# the adapter uses that as the policy label - so it names the rule, not the file.
package no_plaintext_credentials

# is_string guards the regex: a helm-rendered numeric value would otherwise make
# the builtin undefined rather than matching, which is the same outcome by luck
# instead of by intent.
deny contains msg if {
	input.kind == "ConfigMap"
	some key, value in input.data
	is_string(value)
	regex.match(`(?i)(password|token|secret)\s*=`, value)
	msg := sprintf("ConfigMap/%s: data key %q must not carry a plaintext credential", [input.metadata.name, key])
}
