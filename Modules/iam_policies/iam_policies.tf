resource "aws_iam_policy" "s3_dev_access_web_sites_cf_offshore" {
  name        = "S3_Dev_Access_Web_Sites_CF_Offshore"
  path        = "/"
  description = "Provides access to non-production portal sites and ability to invalidate Cloud Front content in non-production."
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::online-dev.aws.paysign.com",
                "arn:aws:s3:::online-dev.aws.paysign.com/*",
                "arn:aws:s3:::online-deploy.aws.paysign.com",
                "arn:aws:s3:::online-deploy.aws.paysign.com/*",
                "arn:aws:s3:::online-test.aws.paysign.com",
                "arn:aws:s3:::online-test.aws.paysign.com/*",
                "arn:aws:s3:::mycard-dev.aws.paysign.com",
                "arn:aws:s3:::mycard-dev.aws.paysign.com/*",
                "arn:aws:s3:::mycard-deploy.aws.paysign.com",
                "arn:aws:s3:::mycard-deploy.aws.paysign.com/*",
                "arn:aws:s3:::documents-dev.aws.paysign.com",
                "arn:aws:s3:::documents-dev.aws.paysign.com/*",
                "arn:aws:s3:::copayportal-dev.aws.paysign.com",
                "arn:aws:s3:::copayportal-dev.aws.paysign.com/*",
                "arn:aws:s3:::copayportal-test.aws.paysign.com",
                "arn:aws:s3:::copayportal-test.aws.paysign.com/*",
                "arn:aws:s3:::copayportal-deploy-prod.aws.paysign.com",
                "arn:aws:s3:::copayportal-deploy-prod.aws.paysign.com/*",
                "arn:aws:s3:::portal-dev.paysignpremier.com",
                "arn:aws:s3:::portal-dev.paysignpremier.com/*",
                "arn:aws:s3:::portal-test.paysignpremier.com",
                "arn:aws:s3:::portal-test.paysignpremier.com/*",
                "arn:aws:s3:::portal-deploy.paysignpremier.com",
                "arn:aws:s3:::portal-deploy.paysignpremier.com/*",
                "arn:aws:s3:::www.afforda.us",
                "arn:aws:s3:::www.afforda.us/*",
                "arn:aws:s3:::pop-dev.aws.paysign.com",
                "arn:aws:s3:::pop-dev.aws.paysign.com/*",
                "arn:aws:s3:::partnerportal-dev.aws.paysign.com/*",
                "arn:aws:s3:::partnerportal-dev.aws.paysign.com",
                "arn:aws:s3:::copayportal-deploy-stage.aws.paysign.com",
                "arn:aws:s3:::copayportal-deploy-stage.aws.paysign.com/*",
                "arn:aws:s3:::csg-dev.aws.paysign.com",
                "arn:aws:s3:::csg-dev.aws.paysign.com/*",
                "arn:aws:s3:::portal-deploy.paysignrewardcard.com",
                "arn:aws:s3:::portal-deploy.paysignrewardcard.com/*",
                "arn:aws:s3:::portal-dev.paysignrewardcard.com",
                "arn:aws:s3:::portal-dev.paysignrewardcard.com/*",
                "arn:aws:s3:::portal-test.paysignrewardcard.com",
                "arn:aws:s3:::portal-test.paysignrewardcard.com/*",
                "arn:aws:s3:::pop-test.aws.paysign.com/*",
                "arn:aws:s3:::pop-test.aws.paysign.com/",
                "arn:aws:s3:::partnerportal-test.aws.paysign.com/*",
                "arn:aws:s3:::partnerportal-test.aws.paysign.com/",
                "arn:aws:s3:::pms-dmm-dev.aws.paysign.com",
                "arn:aws:s3:::pms-dmm-dev.aws.paysign.com/*",
                "arn:aws:s3:::pop-deploy.aws.paysign.com/*",
                "arn:aws:s3:::pop-deploy.aws.paysign.com/",
                "arn:aws:s3:::partnerportal-deploy.aws.paysign.com/*",
                "arn:aws:s3:::partnerportal-deploy.aws.paysign.com/",
                "arn:aws:s3:::pop-deploy-stage.aws.paysign.com/*",
                "arn:aws:s3:::pop-deploy-stage.aws.paysign.com/",
                "arn:aws:s3:::partnerportal-deploy-stage.aws.paysign.com/*",
                "arn:aws:s3:::partnerportal-deploy-stage.aws.paysign.com/"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:ListAllMyBuckets",
                "cloudfront:ListInvalidations",
                "cloudfront:ListDistributions",
                "cloudfront:GetInvalidation",
                "cloudfront:CreateInvalidation"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_policy" "adminnobilling" {
  name        = "AdminNoBilling"
  path        = "/"
  description = "This policy allows full admin access without account and billing sections."
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:RequestedRegion": "us-east-1"
                }
            }
        },
        {
            "Effect": "Deny",
            "Action": [
                "aws-portal:*",
                "organizations:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_policy" "bm-vpc-s3-readwriteaccess" {
  name        = "BM_VPC_S3_ReadWriteAccess"
  path        = "/"
  description = ""
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucketVersions",
                "s3:ListBucket",
                "s3:GetBucketLocation"
            ],
            "Resource": "arn:aws:s3:::bm-vpc.aws.paysign.com"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObjectAcl",
                "s3:GetObject",
                "s3:DeleteObjectVersion",
                "s3:ListBucketVersions",
                "s3:DeleteObject",
                "s3:PutObjectAcl",
                "s3:GetObjectVersion"
            ],
            "Resource": [
                "arn:aws:s3:::bm-vpc.aws.paysign.com",
                "arn:aws:s3:::bm-vpc.aws.paysign.com/*"
            ]
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": "s3:ListAllMyBuckets",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_policy" "s3_dev_access_web_sites_cf" {
  name        = "S3_Dev_Access_Web_Sites_CF"
  path        = "/"
  description = "Policy used by the dev team to manage S3 and CloudFront deployments in dev account."
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::online-dev.aws.paysign.com",
                "arn:aws:s3:::online-dev.aws.paysign.com/*",
                "arn:aws:s3:::online-test.aws.paysign.com",
                "arn:aws:s3:::online-test.aws.paysign.com/*",
                "arn:aws:s3:::mycard-dev.aws.paysign.com",
                "arn:aws:s3:::mycard-dev.aws.paysign.com/*",
                "arn:aws:s3:::app-dev.aws.paysign.com",
                "arn:aws:s3:::app-dev.aws.paysign.com/*",
                "arn:aws:s3:::documents-dev.aws.paysign.com",
                "arn:aws:s3:::documents-dev.aws.paysign.com/*",
                "arn:aws:s3:::portaladmin-dev.aws.paysign.com",
                "arn:aws:s3:::portaladmin-dev.aws.paysign.com/*",
                "arn:aws:s3:::copayportal-dev.aws.paysign.com",
                "arn:aws:s3:::copayportal-dev.aws.paysign.com/*",
                "arn:aws:s3:::copayportal-test.aws.paysign.com",
                "arn:aws:s3:::copayportal-test.aws.paysign.com/*",
                "arn:aws:s3:::copayportal-deploy.aws.paysign.com",
                "arn:aws:s3:::copayportal-deploy.aws.paysign.com/*",
                "arn:aws:s3:::portal-dev.paysignpremier.com",
                "arn:aws:s3:::portal-dev.paysignpremier.com/*",
                "arn:aws:s3:::portal-test.paysignpremier.com",
                "arn:aws:s3:::portal-test.paysignpremier.com/*",
                "arn:aws:s3:::portal-deploy.paysignpremier.com",
                "arn:aws:s3:::portal-deploy.paysignpremier.com/*",
                "arn:aws:s3:::www.afforda.us",
                "arn:aws:s3:::www.afforda.us/*",
                "arn:aws:s3:::csg-dev.aws.paysign.com",
                "arn:aws:s3:::csg-dev.aws.paysign.com/*",
                "arn:aws:s3:::portal-deploy.paysignrewardcard.com",
                "arn:aws:s3:::portal-deploy.paysignrewardcard.com/*",
                "arn:aws:s3:::portal-dev.paysignrewardcard.com",
                "arn:aws:s3:::portal-dev.paysignrewardcard.com/*",
                "arn:aws:s3:::portal-test.paysignrewardcard.com",
                "arn:aws:s3:::portal-test.paysignrewardcard.com/*",
                "arn:aws:s3:::pms-dmm-dev.aws.paysign.com",
                "arn:aws:s3:::pms-dmm-dev.aws.paysign.com/*"
            ]
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "s3:ListAllMyBuckets",
            "Resource": "*"
        },
        {
            "Sid": "AllowAllCloudFrontPermissions",
            "Effect": "Allow",
            "Action": [
                "cloudfront:*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}