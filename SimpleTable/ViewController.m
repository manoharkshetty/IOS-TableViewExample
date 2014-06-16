//
//  ViewController.m
//  SimpleTable
//
//  Created by Manohar on 11/06/14.
//  Copyright (c) 2014 Manohar. All rights reserved.
//

#import "ViewController.h"
#import "SImpleTableCell.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray *names;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    NSString *path = [[NSBundle mainBundle] pathForResource:@"names" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
   // names = [[NSArray alloc] initWithContentsOfFile:path];
    names=[NSMutableArray arrayWithObjects:@"manohar",@"shreedhar",@"ravindra Kumar",@"vetrichelvan",@"punith", nil];
   

	// Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [names count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *simpleTableIdentifier = @"SimpleTableCell";
//    
//    SImpleTableCell *cell = (SImpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    if (cell == nil)
//    {
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
//        cell = [nib objectAtIndex:0];
//    }
//    
//    
//    cell.nameLabel.text = [names objectAtIndex:indexPath.row];
//    cell.thumbnailImageView.image=[UIImage imageNamed:@"IMG_0741.JPG"];
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Display recipe in the table cell
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    recipeImageView.image = [UIImage imageNamed:@"IMG_0741.JPG"];
    
    UILabel *recipeNameLabel = (UILabel *)[cell viewWithTag:101];
    recipeNameLabel.text = [names objectAtIndex:indexPath.row];
    
    UILabel *recipeDetailLabel = (UILabel *)[cell viewWithTag:102];
    recipeDetailLabel.text = @"30 minuts";
    
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * selected=[NSString stringWithFormat:@"you have selected %@",[names objectAtIndex:indexPath.row]];
    UIAlertView *msg=[[UIAlertView alloc]initWithTitle:@"simple Table" message:selected delegate:nil cancelButtonTitle:@"Okey" otherButtonTitles:nil, nil];
    [msg show];
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType=UITableViewCellAccessoryCheckmark;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [names removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
    
}

@end
