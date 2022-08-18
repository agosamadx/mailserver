require ["fileinto"];
# rule:[spam]
if allof (header :is "X-Spam-Flag" "YES")
{
        fileinto "Junk";
}
